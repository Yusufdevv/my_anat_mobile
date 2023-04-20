// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/entities/doctor_map_entity.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_organization_bloc.freezed.dart';

part 'map_organization_event.dart';

part 'map_organization_state.dart';

typedef OnMapControllerChange = Function(double lat, double long);

class MapOrganizationBloc extends Bloc<MapOrganizationEvent, MapOrganizationState> {
  final GetMapHospitalUseCase getHospitals = GetMapHospitalUseCase();
  final GetMapDoctorUseCase getDoctors = GetMapDoctorUseCase(repo: serviceLocator<GlobalRequestRepository>());
  final double deviceWidth;
  final GetTypesUseCase getTypesUseCase = GetTypesUseCase(repository: serviceLocator<MapRepositoryImpl>());

  MapOrganizationBloc({required this.deviceWidth, required TickerProvider tickerProvider})
      : super(MapOrganizationState(tabController: TabController(length: 2, vsync: tickerProvider))) {
    on<_OnMapCreated>(_onMapCreated);
    on<_ChangeTab>(_changeTab);
    on<_ZoomIn>(_zoomIn);
    on<_ZoomOut>(_zoomOut);

    on<_GetHospitals>(_getHospitals);

    on<_GetTypes>(_getTypes);
    on<_GetMoreTypes>(_getMorTypes);

    on<_GetDoctors>(_getDoctors);

    on<_ChangeLatLong>(_changeLatLong);
    on<_GetCurrentLocation>(_getCurrentLocation);
    on<_ChangeSearchText>((event, emit) {
      emit(state.copyWith(searchText: event.text));
    });
    on<_ChangeRadius>((event, emit) {
      emit(state.copyWith(radius: event.radius));
    });
  }
  FutureOr<void> _zoomIn(_ZoomIn event, Emitter<MapOrganizationState> emit) async {
    if (state.maxZoomLevel > state.zoomLevel) {
      state.mapController!.moveCamera(CameraUpdate.zoomTo(state.zoomLevel + 1),
          animation: const MapAnimation(duration: 0.2, type: MapAnimationType.smooth));
      emit(state.copyWith(zoomLevel: state.zoomLevel + 1));
    }
  }

  FutureOr<void> _zoomOut(_ZoomOut event, Emitter<MapOrganizationState> emit) async {
    if (state.minZoomLevel < state.zoomLevel) {
      state.mapController!.moveCamera(
        CameraUpdate.zoomTo(state.zoomLevel - 1),
        animation: const MapAnimation(duration: 0.2, type: MapAnimationType.smooth),
      );
      emit(state.copyWith(zoomLevel: state.zoomLevel - 1));
    }
  }

  FutureOr<void> _changeTab(_ChangeTab event, Emitter<MapOrganizationState> emit) async {
    if (event.haveToLoading) {
      emit(state.copyWith(tabChangingStatus: FormzStatus.submissionInProgress));
      await Future.delayed(const Duration(milliseconds: 500));
    }

    if (event.tab == 0) {
      await MyFunctions.addHospitals(
        deviceWidth: deviceWidth,
        points: state.hospitals,
        context: event.context,
        point: Point(latitude: state.currentLat, longitude: state.currentLong),
        accuracy: event.acuracy,
        onMapControllerChange: (lat, long) async {
          await state.mapController!.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: Point(
                  latitude: lat,
                  longitude: long,
                ),
                zoom: 15,
              ),
            ),
            animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
          );
        },
      ).then((placemarkss) async {
        await state.mapController!.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                latitude: state.currentLat,
                longitude: state.currentLong,
              ),
              zoom: 15,
            ),
          ),
          animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
        );

        emit(
          state.copyWith(
            tabChangingStatus: event.haveToLoading ? FormzStatus.submissionSuccess : state.tabChangingStatus,
            mapObjects: placemarkss,
          ),
        );
      });
    } else {
      await MyFunctions.addDoctors(
        deviceWidth: deviceWidth,
        points: state.doctors,
        context: event.context,
        point: Point(latitude: state.currentLat, longitude: state.currentLong),
        accuracy: event.acuracy,
        onMapControllerChange: (lat, long) async {
          await state.mapController!.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: Point(
                  latitude: lat,
                  longitude: long,
                ),
                zoom: 15,
              ),
            ),
            animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
          );
        },
      ).then((placemarkss) async {
        await state.mapController!.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                latitude: state.currentLat,
                longitude: state.currentLong,
              ),
              zoom: 15,
            ),
          ),
          animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
        );

        emit(
          state.copyWith(
            tabChangingStatus: event.haveToLoading ? FormzStatus.submissionSuccess : state.tabChangingStatus,
            mapObjects: placemarkss,
          ),
        );
      });
    }
  }

  FutureOr<void> _getHospitals(_GetHospitals event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getHospitals(
      state.searchText,
      param: MapParameter(
        lat: event.latitude ?? state.lat,
        long: event.longitude ?? state.long,
        // todo get hospital radius
        radius: 150,
      ),
    );
    if (result.isRight) {
      if (state.tabController?.index == 0) {
        await MyFunctions.addHospitals(
          deviceWidth: deviceWidth,
          points: result.right,
          context: event.context,
          point: Point(latitude: state.currentLat, longitude: state.currentLong),
          accuracy: state.accuracy,
          onMapControllerChange: (lat, long) async {
            await state.mapController!.moveCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: Point(
                    latitude: lat,
                    longitude: long,
                  ),
                  zoom: 15,
                ),
              ),
              animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
            );
          },
        ).then((placemarks) {
          emit(
            state.copyWith(
              hospitals: result.right,
              status: FormzStatus.submissionSuccess,
              mapObjects: placemarks,
            ),
          );
        });
      } else {
        emit(
          state.copyWith(
            hospitals: result.right,
            status: FormzStatus.submissionSuccess,
          ),
        );
      }
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getTypes(_GetTypes event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(typesStatus: FormzStatus.submissionInProgress));
    final result = await getTypesUseCase.call(event.searchText);
    if (result.isRight) {
      emit(state.copyWith(
        types: result.right.results,
        typesStatus: FormzStatus.submissionSuccess,
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getMorTypes(_GetMoreTypes event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getTypesUseCase.call(event.searchText);
    if (result.isRight) {
      emit(state.copyWith(types: result.right.results, status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getDoctors(_GetDoctors event, Emitter<MapOrganizationState> emit) async {
    final result =
        await getDoctors(state.searchText, param: MapParameter(lat: state.lat, long: state.long, radius: 150));
    if (result.isRight) {
      if (state.tabController?.index == 1) {
        await MyFunctions.addDoctors(
          deviceWidth: deviceWidth,
          points: result.right,
          context: event.context,
          point: Point(latitude: state.currentLat, longitude: state.currentLong),
          accuracy: state.accuracy,
          onMapControllerChange: (lat, long) async {
            await state.mapController!.moveCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: Point(
                    latitude: lat,
                    longitude: long,
                  ),
                  zoom: 15,
                ),
              ),
              animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
            );
          },
        ).then((placemarks) {
          emit(
            state.copyWith(
              doctors: result.right,
              status: FormzStatus.submissionSuccess,
              mapObjects: placemarks,
            ),
          );
        });
      } else {
        emit(
          state.copyWith(
            doctors: result.right,
            status: FormzStatus.submissionSuccess,
          ),
        );
      }
    } else {}
  }

  FutureOr<void> _changeLatLong(_ChangeLatLong event, Emitter<MapOrganizationState> emit) async {
    if (event.radius != null) {
      emit(state.copyWith(lat: event.lat, long: event.long, radius: event.radius!));
    } else {
      emit(state.copyWith(lat: event.lat, long: event.long));
    }
  }

  FutureOr<void> _getCurrentLocation(_GetCurrentLocation event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionInProgress));
    try {
      final position = await MyFunctions.determinePosition();

      await StorageRepository.putDouble(StoreKeys.latitude, position.latitude);
      await StorageRepository.putDouble(StoreKeys.longitude, position.longitude);
      final myPoint = Point(latitude: position.latitude, longitude: position.longitude);
      final myPlaceMark = await MyFunctions.getMyPoint(myPoint, event.context);
      var placemarks = [...state.mapObjects];
      placemarks.add(myPlaceMark);

      await state.mapController!.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: Point(
                latitude: position.latitude,
                longitude: position.longitude,
              ),
              zoom: 15),
        ),
        animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
      );
      log(':::::::::: place marks lenth:  ${placemarks.length}  ::::::::::');
      emit(state.copyWith(
          getCurrentLocationStatus: FormzStatus.submissionSuccess, mapObjects: placemarks, zoomLevel: 15));
    } on ParsingException catch (e) {
      event.onError(e.errorMessage);
      emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionSuccess));
    }
  }

  FutureOr<void> _onMapCreated(_OnMapCreated event, Emitter<MapOrganizationState> emit) async {
    if (state.tabController!.index != event.orgMapV2TabIndex) {
      state.tabController!.animateTo(event.orgMapV2TabIndex);
    }
    YandexMapController controller = event.controller;
    var maxZoomLevel = await controller.getMaxZoom();
    var minZoomLevel = await controller.getMinZoom();
    emit(
      state.copyWith(
        mapController: controller,
        minZoomLevel: minZoomLevel,
        maxZoomLevel: maxZoomLevel,
      ),
    );

    final camera = await controller.getCameraPosition();
    var lat = StorageRepository.getDouble(
      StoreKeys.latitude,
      defValue: -1,
    );
    var long = StorageRepository.getDouble(
      StoreKeys.longitude,
      defValue: -1,
    );
    Position? currentPosition;
    if (lat == -1 || long == -1) {
      emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionInProgress));
      currentPosition = await MyFunctions.determinePosition();
      lat = currentPosition.latitude;
      long = currentPosition.longitude;
      await StorageRepository.putDouble(StoreKeys.latitude, lat);
      await StorageRepository.putDouble(StoreKeys.longitude, long);
    }

    controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(latitude: lat, longitude: long),
        ),
      ),
      animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
    );
    final hospitalResult = await getHospitals(
      state.searchText,
      param: MapParameter(
        lat: lat,
        long: long,
        // todo get hospital radius
        radius: 150,
      ),
    );

    final doctorsResult =
        await getDoctors(state.searchText, param: MapParameter(lat: state.lat, long: state.long, radius: 150));

    emit(state.copyWith(
        getCurrentLocationStatus: FormzStatus.submissionSuccess,
        doctors: doctorsResult.isRight ? doctorsResult.right : [],
        hospitals: hospitalResult.isRight ? hospitalResult.right : [],
        lat: lat,
        long: long,
        currentLat: lat,
        currentLong: long,
        radius: MyFunctions.getRadiusFromZoom(camera.zoom).toInt()));
    add(MapOrganizationEvent.changeTab(
        context: event.context, tab: 0, acuracy: currentPosition?.accuracy ?? 20.0, haveToLoading: false));
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
