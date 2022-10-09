part of 'doctor_list_bloc.dart';

@Freezed()
class DoctorListState with _$DoctorListState {
  factory DoctorListState({
    @Default([]) List<HospitalDoctorsEntity> doctors,
    @Default(FormzStatus.pure) FormzStatus status,
    String? next,
    @Default(false) bool fetchMore,
  }) = _DoctorListState;
}
