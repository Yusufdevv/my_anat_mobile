part of 'hospital_vacancies_bloc.dart';

@Freezed()
class HospitalVacanciesState with _$HospitalVacanciesState {
  factory HospitalVacanciesState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<VacancyListEntity> vacancies,
    String? next,
    @Default(false) bool fetchMore,
    @Default(0) int organizationId,
  }) = _HospitalVacanciesState;
}
