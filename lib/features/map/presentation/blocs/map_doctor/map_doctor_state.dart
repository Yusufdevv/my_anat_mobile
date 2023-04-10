part of 'map_doctor_bloc.dart';

@Freezed()
class MapDoctorState with _$MapDoctorState {
  factory MapDoctorState({
    @Default([]) List<DoctorSpecModel> doctors,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _MapDoctorState;
}
