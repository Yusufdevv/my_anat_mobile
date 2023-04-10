part of 'map_doctor_bloc.dart';

@Freezed()
class MapDoctorState with _$MapDoctorState {
  factory MapDoctorState({
    @Default([]) List<DoctorMapEntity> doctors,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _MapDoctorState;
}
