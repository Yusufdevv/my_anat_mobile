part of 'hospital_vacancies_bloc.dart';

@Freezed()
 class HospitalVacanciesEvent with _$HospitalVacanciesEvent {
   factory HospitalVacanciesEvent.getVacancies({int? organizationId})=_GetVacancies;
 }
