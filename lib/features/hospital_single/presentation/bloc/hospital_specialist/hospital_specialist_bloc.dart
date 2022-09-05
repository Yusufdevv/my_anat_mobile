import 'dart:async';

import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_specialist.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_specialists.dart';
import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'hospital_specialist_event.dart';

part 'hospital_specialist_state.dart';

part 'hospital_specialist_bloc.freezed.dart';

class HospitalSpecialistBloc
    extends Bloc<HospitalSpecialistEvent, HospitalSpecialistState> {
  final GetSpecialistsUseCase getSpecialists;

  HospitalSpecialistBloc(this.getSpecialists)
      : super(HospitalSpecialistState()) {
    on<_GetSpecialists>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));

      final result = await getSpecialists(TypeParameter(id: event.organizationId??-1, next: ''));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            specialists: result.right.results));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
  }
}
