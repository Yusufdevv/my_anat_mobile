import 'dart:async';

import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_hospitals.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'doctor_list_event.dart';

part 'doctor_list_state.dart';

part 'doctor_list_bloc.freezed.dart';

class DoctorListBloc extends Bloc<DoctorListEvent, DoctorListState> {
  final GetDoctorsUseCase useCase;

  DoctorListBloc(this.useCase) : super(DoctorListState()) {
    on<_GetDoctors>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase(SearchParam(next: '',search: event.search));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            doctors: result.right.results,
            next: result.right.next ?? '',
            count: result.right.count));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
    on<_GetMoreDoctors>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase(SearchParam(next: state.next, ));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            doctors: [...state.doctors, ...result.right.results],
            next: result.right.next ?? '',
            count: result.right.count));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
          (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
