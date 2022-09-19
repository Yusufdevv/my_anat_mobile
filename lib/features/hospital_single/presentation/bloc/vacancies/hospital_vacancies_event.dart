part of 'hospital_vacancies_bloc.dart';

@Freezed()
class HospitalVacanciesEvent with _$HospitalVacanciesEvent {
  factory HospitalVacanciesEvent.getVacancies({required int organizationId}) = _GetVacancies;
  factory HospitalVacanciesEvent.getMoreVacancies() = _GetMoreVacancies;
}
