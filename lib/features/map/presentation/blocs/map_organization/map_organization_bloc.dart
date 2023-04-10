import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/domain/entities/doctor_map_entity.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
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
  final GetMapHospitalUseCase getHospitals;
  final GetMapDoctorUseCase getDoctors;
  final double deviceWidth;

  MapOrganizationBloc(this.getHospitals, this.getDoctors,
      {required this.deviceWidth, required GetTypesUseCase getTypesUseCase, required TickerProvider tickerProvider})
      : super(MapOrganizationState(tabController: TabController(length: 2, vsync: tickerProvider))) {
    on<_OnMapCreated>((event, emit) async {
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
      final position = Point(
        latitude: StorageRepository.getDouble(
          'lat',
          defValue: 41.310990,
        ),
        longitude: StorageRepository.getDouble(
          'long',
          defValue: 69.281997,
        ),
      );
      controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(latitude: position.latitude, longitude: position.longitude),
          ),
        ),
        animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
      );
      add(
        MapOrganizationEvent.getCurrentLocation(
          context: event.context,
          onError: (message) {
            event.context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
          },
          onSuccess: (position) async {
            var accuracy = position.accuracy;

            final hospitalResult = await getHospitals(
              state.searchText,
              param: MapParameter(
                lat: position.latitude,
                long: position.longitude,
                // todo get hospital radius
                radius: 150,
              ),
            );

            final doctorsResult =
                await getDoctors(state.searchText, param: MapParameter(lat: state.lat, long: state.long, radius: 150));
            emit(state.copyWith(
                doctors: doctorsResult.isRight ? doctorsResult.right : [],
                hospitals: hospitalResult.isRight ? hospitalResult.right : [],
                lat: position.latitude,
                long: position.longitude,
                radius: MyFunctions.getRadiusFromZoom(camera.zoom).toInt()));
            add(MapOrganizationEvent.changeTab(context: event.context, tab: 0, acuracy: accuracy));
          },
        ),
      );
    });
    on<_ChangeTab>((event, emit) async {
      emit(state.copyWith(tabChangingStatus: FormzStatus.submissionInProgress));
      if (event.tab == 0) {
        await MyFunctions.addHospitals(
          onPointsCreated: (placemarks) {
            emit(
              state.copyWith(
                tabChangingStatus: FormzStatus.submissionSuccess,
                mapObjects: placemarks,
              ),
            );
          },
          deviceWidth: deviceWidth,
          points: state.hospitals,
          context: event.context,
          point: Point(latitude: state.currentLat, longitude: state.currentLong),
          accuracy: event.acuracy,
          onMapControllerChange: (lat, long) {
            state.mapController!.moveCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: Point(
                    latitude: lat,
                    longitude: long,
                  ),
                  zoom: 15,
                ),
              ),
            );
          },
        );
        emit(state.copyWith(tabChangingStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(tabChangingStatus: FormzStatus.submissionSuccess));
      }
    });

    on<_GetHospitals>((event, emit) async {
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
        emit(state.copyWith(hospitals: result.right, status: FormzStatus.submissionSuccess));
        add(MapOrganizationEvent.changeTab(
          tab: 0,
          context: event.context,
          acuracy: state.accuracy,
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetTypes>((event, emit) async {
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
    });
    on<_GetMoreTypes>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getTypesUseCase.call(event.searchText);
      if (result.isRight) {
        emit(state.copyWith(types: result.right.results, status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetDoctors>((event, emit) async {
      final result =
          await getDoctors(state.searchText, param: MapParameter(lat: state.lat, long: state.long, radius: 150));
      if (result.isRight) {
        emit(state.copyWith(
          doctors: result.right,
        ));
      } else {}
    });
    on<_ChangeSearchText>((event, emit) {
      emit(state.copyWith(searchText: event.text));
    });
    on<_ChangeRadius>((event, emit) {
      emit(state.copyWith(radius: event.radius));
    });

    on<_ChangeLatLong>((event, emit) {
      if (event.radius != null) {
        emit(state.copyWith(lat: event.lat, long: event.long, radius: event.radius!));
      } else {
        emit(state.copyWith(lat: event.lat, long: event.long));
      }
    }, transformer: debounce(const Duration(milliseconds: 300)));
    on<_GetCurrentLocation>((event, emit) async {
      emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionInProgress));
      try {
        final position = await MyFunctions.determinePosition();
        final myPoint = Point(latitude: position.latitude, longitude: position.longitude);
        final myPlaceMark = await MyFunctions.getMyPoint(myPoint, event.context);
        var placemarks = [...state.mapObjects];
        placemarks.add(myPlaceMark);

        emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionSuccess, mapObjects: placemarks));
        state.mapController!.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(latitude: position.latitude, longitude: position.longitude),
            ),
          ),
          animation: const MapAnimation(duration: 0.15, type: MapAnimationType.smooth),
        );
        event.onSuccess(position);
      } on ParsingException catch (e) {
        event.onError(e.errorMessage);
        emit(state.copyWith(getCurrentLocationStatus: FormzStatus.submissionSuccess));
      }
    });
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
