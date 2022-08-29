import 'dart:async';

import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_single_hospital.dart';
import 'package:anatomica/features/map/domain/entities/hospital_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'hospital_single_event.dart';

part 'hospital_single_state.dart';

part 'hospital_single_bloc.freezed.dart';

class HospitalSingleBloc
    extends Bloc<HospitalSingleEvent, HospitalSingleState> {
  final GetSingleHospitalUseCase useCase;

  HospitalSingleBloc(this.useCase) : super(HospitalSingleState()) {
    on<_GetHospital>((event, emit) async {
      final result = await useCase(event.slug);
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess,hospital: result.right));
      }else {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));

      }
    });
  }
}