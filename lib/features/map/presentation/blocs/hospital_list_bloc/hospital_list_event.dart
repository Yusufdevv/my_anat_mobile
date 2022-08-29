part of 'hospital_list_bloc.dart';


@Freezed()
class HospitalListEvent with _$HospitalListEvent {
  factory HospitalListEvent.changePage(CrossFadeState crossFadeState) =
      _ChangePage;
  factory HospitalListEvent.getHospitals({required String search})=_GetHospitals;
  factory HospitalListEvent.getMoreHospitals()=_GetMoreHospitals;
}
