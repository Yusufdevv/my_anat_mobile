part of 'doctor_list_bloc.dart';



@Freezed()
 class DoctorListEvent with _$DoctorListEvent {
   factory DoctorListEvent.getDoctors({required String search})=_GetDoctors;
   factory DoctorListEvent.getMoreDoctors()=_GetMoreDoctors;
 }
