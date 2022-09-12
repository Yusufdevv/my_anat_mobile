part of 'hospital_specialist_bloc.dart';

@Freezed()
 class HospitalSpecialistEvent with _$HospitalSpecialistEvent {
  factory HospitalSpecialistEvent.getSpecialists({int? organizationId})=_GetSpecialists;
}
