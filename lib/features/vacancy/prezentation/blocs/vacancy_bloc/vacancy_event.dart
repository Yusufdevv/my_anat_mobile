part of 'vacancy_bloc.dart';

@immutable
abstract class VacancyEvent {}

class GetVacancyListEvent extends VacancyEvent {}

class GetMoreVacancyListEvent extends VacancyEvent {}

class GetTopOrganizationEvent extends VacancyEvent {}

class GetVacancyOptionEvent extends VacancyEvent {}

class GetOrganizationVacancyEvent extends VacancyEvent {}

class GetMoreOrganizationVacancyEvent extends VacancyEvent {}
