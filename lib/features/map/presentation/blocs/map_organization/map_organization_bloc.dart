import 'dart:async';

import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'map_organization_event.dart';

part 'map_organization_state.dart';

part 'map_organization_bloc.freezed.dart';

class MapOrganizationBloc
    extends Bloc<MapOrganizationEvent, MapOrganizationState> {
  final GetMapHospitalUseCase getHospitals;
  final GetMapDoctorUseCase getDoctors;

  MapOrganizationBloc(this.getHospitals,this.getDoctors) : super(MapOrganizationState()) {
    on<_GetHospitals>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getHospitals('', param: event.param);
      if (result.isRight) {
        print(state.hospitals.length.toString()+'isLenght141');
        emit(state.copyWith(
            hospitals: result.right, status: FormzStatus.submissionSuccess));
        print(state.hospitals.length.toString()+'isLenght141');
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });

    on<_GetDoctors>((event, emit) async {
      final result = await getDoctors('', param: event.param);
      if (result.isRight) {
        emit(state.copyWith(
            doctors: result.right, ));
      } else {

      }
    });
  }
}
