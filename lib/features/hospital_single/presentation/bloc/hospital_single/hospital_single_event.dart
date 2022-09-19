part of 'hospital_single_bloc.dart';

@Freezed()
class HospitalSingleEvent with _$HospitalSingleEvent {
  factory HospitalSingleEvent.getHospital(String slug) = _GetHospital;
}
