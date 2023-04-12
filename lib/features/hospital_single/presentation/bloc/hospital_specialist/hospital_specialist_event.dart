part of 'hospital_specialist_bloc.dart';

@Freezed()
class HospitalSpecialistDoctorsEvent with _$HospitalSpecialistDoctorsEvent {
  factory HospitalSpecialistDoctorsEvent.getSpecialistsDoctors({required int organizationId}) = _GetSpecialistsDoctors;
  factory HospitalSpecialistDoctorsEvent.getMoreSpecialistsDoctors() = _GetMoreSpecialistsDoctors;
}
