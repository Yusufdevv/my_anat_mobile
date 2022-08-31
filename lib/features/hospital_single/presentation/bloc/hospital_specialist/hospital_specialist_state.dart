part of 'hospital_specialist_bloc.dart';

@Freezed()
class HospitalSpecialistState with _$HospitalSpecialistState {
  factory HospitalSpecialistState({
    @Default([])List<DoctorsModel> specialists,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default('') String next,
    @Default(0) int count,
})=_HospitalSpecialistState;
}