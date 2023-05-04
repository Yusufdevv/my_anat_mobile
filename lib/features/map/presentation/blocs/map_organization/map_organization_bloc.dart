import 'dart:async';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/entities/doctor_map_entity.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals_with_distance.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'map_organization_event.dart';

part 'map_organization_state.dart';

typedef OnMapControllerChange = Function(double lat, double long);

class MapOrganizationBloc extends Bloc<MapEvent, MapOrganizationState> {
  final GetDoctorsUseCase getDoctors = GetDoctorsUseCase();
  final GetHopitalsMapUseCase getHospitalsUseCase =
      GetHopitalsMapUseCase(mapRepository: serviceLocator<MapRepositoryImpl>());
  final double deviceWidth;
  late YandexMapController mapController;

  MapOrganizationBloc({required this.deviceWidth, required TickerProvider tickerProvider})
      : super(
          MapOrganizationState(
            focusNode: FocusNode(),
            tabController: TabController(
              length: 2,
              vsync: tickerProvider,
            ),
            searchController: TextEditingController(),
          ),
        ) {
    on<MapOnCreateEvent>(_onMapCreated);
    on<MapChangeTabEvent>(_changeTab);
    on<MapZoomIn>(_zoomIn);
    on<MapZoomOut>(_zoomOut);
    on<MapGetHospitalsEvent>(_getHospitals);
    on<MapGetDoctorsEvent>(_getDoctors);
    on<MapGetMoreDoctorsEvent>(_getMoreDoctors);
    on<MapGetCurrentLocationEvent>(_getCurrentLocation);
    on<MapGetMoreHospitalsEvent>(_getMoreHospitals);
    on<MapChooseEvent>(_choose);
    on<MapUnFocusAndClearControllerEvent>(_unFocus);
  }

  FutureOr<void> _unFocus(MapUnFocusAndClearControllerEvent event, Emitter<MapOrganizationState> emit) async {
    if (!event.notUnFocus) {
      state.focusNode.unfocus();
    }
    emit(state.copyWith(searchController: TextEditingController()));
  }

  FutureOr<void> _getMoreHospitals(MapGetMoreHospitalsEvent event, Emitter<MapOrganizationState> emit) async {
    if (state.hospitalsNext == null) return;
    final result = await getHospitalsUseCase(MapV2Params(next: state.hospitalsNext, where: 'get more hospitals'));
    if (result.isRight) {
      emit(state.copyWith(
        hospitals: [...state.hospitals, ...result.right.results],
        status: FormzStatus.submissionSuccess,
        hospitalsNext: result.right.next ?? '',
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _choose(MapChooseEvent event, Emitter<MapOrganizationState> emit) async {
    if (event.isGetFocus ?? false) {
      state.focusNode.requestFocus();
    }
    emit(state.copyWith(
      screenStatus: event.screenStatus,
      radius: event.radius,
      isGetFocus: event.isGetFocus,
    ));
  }

  FutureOr<void> _zoomIn(MapZoomIn event, Emitter<MapOrganizationState> emit) async {
    if (state.maxZoomLevel > state.zoomLevel) {
      mapController.moveCamera(CameraUpdate.zoomTo(state.zoomLevel + 1),
          animation: const MapAnimation(duration: 0.2, type: MapAnimationType.smooth));
      emit(state.copyWith(zoomLevel: state.zoomLevel + 1));
    }
  }

  FutureOr<void> _zoomOut(MapZoomOut event, Emitter<MapOrganizationState> emit) async {
    if (state.minZoomLevel < state.zoomLevel) {
      mapController.moveCamera(
        CameraUpdate.zoomTo(state.zoomLevel - 1),
        animation: const MapAnimation(duration: 0.2, type: MapAnimationType.smooth),
      );
      emit(state.copyWith(zoomLevel: state.zoomLevel - 1));
    }
  }

  FutureOr<void> _changeTab(MapChangeTabEvent event, Emitter<MapOrganizationState> emit) async {
    final v = event.tab;
    if (state.screenStatus.isList) {
      if (event.tab == 0) {
        add(MapGetHospitalsEvent(context: event.context, where: 'bloc 150'));
      } else {
        add(MapGetDoctorsEvent(context: event.context));
      }
    } else {
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
            await mapController.moveCamera(
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
          await mapController.moveCamera(
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
            await mapController.moveCamera(
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
          await mapController.moveCamera(
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
  }

  FutureOr<void> _getHospitals(MapGetHospitalsEvent event, Emitter<MapOrganizationState> emit) async {
    if (!event.notToLoading) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
    }
    final v = event.where;
    final result = await getHospitalsUseCase.call(MapV2Params(
      where: 'get hospitals ${event.where}',
      radius: 150,
      longitude: state.currentLong,
      latitude: state.currentLat,
      search: state.searchController.text,
    ));
    if (result.isRight) {
      if (state.screenStatus.isMap) {
        await MyFunctions.addHospitals(
          deviceWidth: deviceWidth,
          points: result.right.results,
          context: event.context,
          point: Point(latitude: state.currentLat, longitude: state.currentLong),
          accuracy: state.accuracy,
          onMapControllerChange: (lat, long) async {
            await mapController.moveCamera(
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
              hospitalsNext: result.right.next ?? '',
              hospitals: result.right.results,
              status: FormzStatus.submissionSuccess,
              mapObjects: placemarks,
            ),
          );
        });
      } else {
        emit(
          state.copyWith(
            unUsed: !state.unUsed,
            hospitalsNext: result.right.next ?? '',
            hospitals: result.right.results,
            status: event.notToLoading ? null : FormzStatus.submissionSuccess,
          ),
        );
      }
    } else {
      emit(state.copyWith(status: event.notToLoading ? null : FormzStatus.submissionSuccess));
    }
  }

  FutureOr<void> _getDoctors(MapGetDoctorsEvent event, Emitter<MapOrganizationState> emit) async {
    final result = await getDoctors(
      MapV2Params(
        where: 'get doctors',
        radius: 150,
        longitude: state.currentLong,
        latitude: state.currentLat,
        search: state.searchController.text,
      ),
    );
    if (result.isRight) {
      if (state.screenStatus.isMap) {
        await MyFunctions.addDoctors(
          deviceWidth: deviceWidth,
          points: result.right.results,
          context: event.context,
          point: Point(latitude: state.currentLat, longitude: state.currentLong),
          accuracy: state.accuracy,
          onMapControllerChange: (lat, long) async {
            await mapController.moveCamera(
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
              doctors: result.right.results,
              status: FormzStatus.submissionSuccess,
              mapObjects: placemarks,
            ),
          );
        });
      } else {
        emit(
          state.copyWith(
            doctors: result.right.results,
            status: FormzStatus.submissionSuccess,
          ),
        );
      }
    } else {}
  }

  FutureOr<void> _getMoreDoctors(MapGetMoreDoctorsEvent event, Emitter<MapOrganizationState> emit) async {
    final result = await getDoctors(
      MapV2Params(next: state.doctorsNext, where: 'get more doctors'),
    );
    if (result.isRight) {
      emit(
        state.copyWith(doctors: result.right.results),
      );
    } else {}
  }

  FutureOr<void> _getCurrentLocation(MapGetCurrentLocationEvent event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionInProgress));
    try {
      final position = await MyFunctions.determinePosition();

      await StorageRepository.putDouble(StoreKeys.latitude, position.latitude);
      await StorageRepository.putDouble(StoreKeys.longitude, position.longitude);
      final myPoint = Point(latitude: position.latitude, longitude: position.longitude);
      final myPlaceMark = await MyFunctions.getMyPoint(myPoint, event.context);
      var placemarks = [...state.mapObjects];
      placemarks.add(myPlaceMark);

      await mapController.moveCamera(
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
      emit(
        state.copyWith(
          getCurrentLocationStatus: FormzStatus.submissionSuccess,
          mapObjects: placemarks,
          zoomLevel: 15,
          currentLat: position.latitude,
          currentLong: position.longitude,
        ),
      );
    } on ParsingException catch (e) {
      event.onError(e.errorMessage);
      emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionSuccess));
    }
  }

  FutureOr<void> _onMapCreated(MapOnCreateEvent event, Emitter<MapOrganizationState> emit) async {
    mapController = event.controller;

    var maxZoomLevel = await mapController.getMaxZoom();
    var minZoomLevel = await mapController.getMinZoom();

    final camera = await mapController.getCameraPosition();
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

    mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(latitude: lat, longitude: long),
          zoom: 15,
        ),
      ),
      animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
    );
    final hospitalResult = await getHospitalsUseCase
        .call(MapV2Params(longitude: long, latitude: lat, radius: 150, where: 'on map create hospital'));

    final doctorsResult = await getDoctors(
      MapV2Params(
        where: ' on map create doctor',
        search: null,
        latitude: lat,
        longitude: long,
        radius: 150,
      ),
    );

    emit(
      state.copyWith(
        getCurrentLocationStatus: FormzStatus.submissionSuccess,
        doctors: doctorsResult.isRight ? doctorsResult.right.results : [],
        hospitals: hospitalResult.isRight ? hospitalResult.right.results : [],
        hospitalsNext: hospitalResult.isRight ? hospitalResult.right.next ?? '' : null,
        zoomLevel: 15,
        currentLat: lat,
        currentLong: long,
        radius: MyFunctions.getRadiusFromZoom(camera.zoom).toInt(),
        minZoomLevel: minZoomLevel,
        maxZoomLevel: maxZoomLevel,
      ),
    );
    add(MapChangeTabEvent(
        context: event.context, tab: 0, acuracy: currentPosition?.accuracy ?? 20.0, haveToLoading: false));
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

enum MapScreenStatus { map, list }

extension MapScreenStatusExtention on MapScreenStatus {
  bool get isList => this == MapScreenStatus.list;

  bool get isMap => this == MapScreenStatus.map;

  MapScreenStatus get switchIt => this == MapScreenStatus.map ? MapScreenStatus.list : MapScreenStatus.map;
}
