part of 'hospital_specialist_bloc.dart';

@Freezed()
class HospitalSpecialistState with _$HospitalSpecialistState {
  factory HospitalSpecialistState({
    @Default([]) List<HospitalDoctorsEntity> specialists,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus paginationStatus,
    String? next,
    @Default(false) bool fetchMore,
    @Default(0) int organizationId,
  }) = _HospitalSpecialistState;
}
