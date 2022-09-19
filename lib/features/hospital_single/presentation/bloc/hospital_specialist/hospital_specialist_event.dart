part of 'hospital_specialist_bloc.dart';

@Freezed()
class HospitalSpecialistEvent with _$HospitalSpecialistEvent {
  factory HospitalSpecialistEvent.getSpecialists({required int organizationId}) = _GetSpecialists;
  factory HospitalSpecialistEvent.getMoreSpecialists() = _GetMoreSpecialists;
}
