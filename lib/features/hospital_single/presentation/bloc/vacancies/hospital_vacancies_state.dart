part of 'hospital_vacancies_bloc.dart';


@Freezed()
 class HospitalVacanciesState with _$HospitalVacanciesState  {
   factory HospitalVacanciesState({
     @Default(FormzStatus.pure) FormzStatus status,
     @Default([]) List<VacancyListEntity> vacancies,
     @Default('') String next,
     @Default(0) int count,
 })=_HospitalVacanciesState;
 }


