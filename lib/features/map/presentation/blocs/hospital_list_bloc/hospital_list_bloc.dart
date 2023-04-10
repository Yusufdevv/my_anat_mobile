import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals_with_distance.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'hospital_list_bloc.freezed.dart';
part 'hospital_list_event.dart';
part 'hospital_list_state.dart';

class HospitalListBloc extends Bloc<HospitalListEvent, HospitalListState> {
  final GetMapHospitalsWithDistanceUseCase getHospitals;

  HospitalListBloc(this.getHospitals) : super(HospitalListState()) {
    on<_ChangePage>((event, emit) {
      emit(state.copyWith(crossFadeState: event.crossFadeState));
    });
    on<_GetHospitals>(
      (event, emit) async {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        final result = await getHospitals.call(MapV2Params(
            title: event.search,
            latitude: event.myPoint.latitude,
            longitude: event.myPoint.longitude));
        if (result.isRight) {
          emit(state.copyWith(
            hospitals: result.right.results,
            status: FormzStatus.submissionSuccess,
            next: result.right.next,
            fetchMore: result.right.next != null,
            count: result.right.count,
          ));
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      },
    );
    on<_GetMoreHospitals>(
      (event, emit) async {
        final result = await getHospitals(MapV2Params(next: state.next));
        if (result.isRight) {
          emit(state.copyWith(
              hospitals: [...state.hospitals, ...result.right.results],
              status: FormzStatus.submissionSuccess,
              next: result.right.next,
              fetchMore: result.right.next != null));
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      },
    );
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
