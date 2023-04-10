part of 'map_doctor_bloc.dart';

@Freezed()
class MapDoctorEvent with _$MapDoctorEvent {
  factory MapDoctorEvent.getMapDoctors(
      {required String search, MapV2Params? params}) = _GetMapDoctors;
}
