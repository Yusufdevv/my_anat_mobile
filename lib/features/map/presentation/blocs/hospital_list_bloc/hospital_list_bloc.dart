import 'package:anatomica/features/map/domain/entities/hospital_entity.dart';
import 'package:anatomica/features/map/domain/usecases/get_hospitals.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_list_event.dart';

part 'hospital_list_state.dart';

part 'hospital_list_bloc.freezed.dart';

class HospitalListBloc extends Bloc<HospitalListEvent, HospitalListState> {
  final GetHospitalsUseCase getHospitals;

  HospitalListBloc(this.getHospitals) : super(HospitalListState()) {
    on<_ChangePage>((event, emit) {
      emit(state.copyWith(crossFadeState: event.crossFadeState));
    });
    on<_GetHospitals>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getHospitals.call('');
      if (result.isRight) {
        emit(state.copyWith(
            hospitals: result.right.results,
            status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<_GetMoreHospitals>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getHospitals(state.next);
      if (result.isRight) {
        emit(state.copyWith(
            hospitals: [...state.hospitals, ...result.right.results],
            status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
