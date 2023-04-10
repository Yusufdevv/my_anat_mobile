part of 'doctor_list_bloc.dart';

@Freezed()
class DoctorListEvent with _$DoctorListEvent {
  factory DoctorListEvent.getDoctors(
      {required String search, required Point myPoint}) = _GetDoctors;
  factory DoctorListEvent.getMoreDoctors() = _GetMoreDoctors;
}
