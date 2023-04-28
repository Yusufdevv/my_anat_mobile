import 'dart:async';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/models/suggestion.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/entities/doctor_map_entity.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals_with_distance.dart';
import 'package:anatomica/features/map/domain/usecases/get_specialization.dart';
import 'package:anatomica/features/map/domain/usecases/get_suggestions.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
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
  final GetSuggestionsUseCase suggestionsUseCase = GetSuggestionsUseCase();
  final GetMapDoctorUseCase getDoctors = GetMapDoctorUseCase(repo: serviceLocator<GlobalRequestRepository>());
  final GetTypesUseCase getTypesUseCase = GetTypesUseCase(repository: serviceLocator<MapRepositoryImpl>());
  final GetSpecializationUseCase getSpecializationsUseCase = GetSpecializationUseCase();
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
    on<MapGetTypesEvent>(_getTypes);
    on<MapGetMoreTypesEvent>(_getMorTypes);
    on<MapGetDoctorsEvent>(_getDoctors);
    on<MapGetCurrentLocationEvent>(_getCurrentLocation);
    on<MapGetHospitalsWithDistance>(_getHospitalsWithDistance);
    on<MapGetMoreHospitalsWithDistanceEvent>(_getMoreHospitalsWithDistance);
    on<MapGetSpecializationsEvent>(_getSpecializations);
    on<MapGetSuggestionsEvent>(_getSuggestions);
    on<MapChooseEvent>(_choose);
    on<MapUnFocusAndClearControllerEvent>(_unFocus);
  }

  FutureOr<void> _unFocus(MapUnFocusAndClearControllerEvent event, Emitter<MapOrganizationState> emit) async {
    if (!event.notUnFocus) {
      state.focusNode.unfocus();
    }
    emit(state.copyWith(searchController: TextEditingController()));
  }

  FutureOr<void> _getSuggestions(MapGetSuggestionsEvent event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress, searchText: event.text));
    final result = await suggestionsUseCase.call(SuggestionParam(
      where: 'Suggestion Bloc _GetSuggestions',
      isDoctor: state.tabController.index == 1,
      search: event.text,
    ));
    if (result.isRight) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress, suggestions: result.right));
    } else {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
      ));
    }
  }

  FutureOr<void> _getSpecializations(MapGetSpecializationsEvent event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(
      status: FormzStatus.submissionInProgress,
    ));
    final result = await getSpecializationsUseCase('');
    if (result.isRight) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess, specializations: result.right.results));
    } else {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
      ));
    }
  }

  FutureOr<void> _getMoreHospitalsWithDistance(
      MapGetMoreHospitalsWithDistanceEvent event, Emitter<MapOrganizationState> emit) async {
    final result = await getHospitalsUseCase(MapV2Params(next: state.next));
    if (result.isRight) {
      emit(state.copyWith(
          hospitals: [...state.hospitals, ...result.right.results],
          status: FormzStatus.submissionSuccess,
          next: result.right.next,
          fetchMore: result.right.next != null));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getHospitalsWithDistance(
      MapGetHospitalsWithDistance event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getHospitalsUseCase.call(
      MapV2Params(
        search: event.search,
        latitude: event.myPoint.latitude,
        longitude: event.myPoint.longitude,
        radius: 150,
      ),
    );
    if (result.isRight) {
      emit(state.copyWith(
        hospitalsWithDistance: result.right.results,
        status: FormzStatus.submissionSuccess,
        next: result.right.next,
        fetchMore: result.right.next != null,
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
      searchText: event.searchText,
      lat: event.lat,
      long: event.long,
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
    if (state.screenStatus.isList) return;
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

  FutureOr<void> _getHospitals(MapGetHospitalsEvent event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getHospitalsUseCase.call(MapV2Params(
      radius: event.radius ?? 150,
      longitude: state.currentLong,
      latitude: state.currentLat,
      search: state.searchText,
      title: event.title,
      offset: event.offset,
      next: event.next,
      district: event.district,
      region: event.region,
      limit: event.limit,
      previous: event.previous,
      service: event.service,
      specializationId: event.specializationId,
    ));
    if (result.isRight) {
      if (state.tabController?.index == 0) {
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
              hospitals: result.right.results,
              status: FormzStatus.submissionSuccess,
              mapObjects: placemarks,
            ),
          );
        });
      } else {
        emit(
          state.copyWith(
            hospitals: result.right.results,
            status: FormzStatus.submissionSuccess,
          ),
        );
      }
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getTypes(MapGetTypesEvent event, Emitter<MapOrganizationState> emit) async {
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

  FutureOr<void> _getMorTypes(MapGetMoreTypesEvent event, Emitter<MapOrganizationState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await getTypesUseCase.call(event.searchText);
    if (result.isRight) {
      emit(state.copyWith(types: result.right.results, status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _getDoctors(MapGetDoctorsEvent event, Emitter<MapOrganizationState> emit) async {
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
          lat: position.latitude,
          long: position.longitude,
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
    final hospitalResult = await getHospitalsUseCase.call(MapV2Params(longitude: long, latitude: lat, radius: 150));

    final doctorsResult =
        await getDoctors(state.searchText, param: MapParameter(lat: state.lat, long: state.long, radius: 150));

    emit(
      state.copyWith(
        getCurrentLocationStatus: FormzStatus.submissionSuccess,
        doctors: doctorsResult.isRight ? doctorsResult.right : [],
        hospitals: hospitalResult.isRight ? hospitalResult.right.results : [],
        zoomLevel: 15,
        lat: lat,
        long: long,
        currentLat: lat,
        currentLong: long,
        radius: MyFunctions.getRadiusFromZoom(camera.zoom).toInt(),
        minZoomLevel: minZoomLevel,
        maxZoomLevel: maxZoomLevel,
      ),
    );
    event.onSuccess(Point(latitude: lat, longitude: long));
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
