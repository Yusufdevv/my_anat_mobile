import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/doctor_single/domain/usecases/get_doctor_single_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'doctor_single_event.dart';
part 'doctor_single_state.dart';

class DoctorSingleBloc extends Bloc<DoctorSingleEvent, DoctorSingleState> {
  final GetDoctorSingleUseCase _getDoctorSingleUseCase;
  DoctorSingleBloc({
    required GetDoctorSingleUseCase getDoctorSingleUseCase,
  })  : _getDoctorSingleUseCase = getDoctorSingleUseCase,
        super(const DoctorSingleState()) {
    on<GetDoctorSingle>((event, emit) async {
      emit(state.copyWith(getDoctorSingleStatus: FormzStatus.submissionInProgress));
      final result = await _getDoctorSingleUseCase.call(event.id);
      if (result.isRight) {
        emit(state.copyWith(getDoctorSingleStatus: FormzStatus.submissionSuccess, doctorSingle: result.right));
      } else {
        emit(state.copyWith(getDoctorSingleStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
