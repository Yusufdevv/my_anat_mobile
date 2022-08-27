part of 'doctor_list_bloc.dart';



@Freezed()
 class DoctorListEvent with _$DoctorListEvent {
   factory DoctorListEvent.getDoctors()=_GetDoctors;
   factory DoctorListEvent.getMoreDoctors()=_GetMoreDoctors;
 }
