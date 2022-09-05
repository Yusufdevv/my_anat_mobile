part of 'vacancy_bloc.dart';

@immutable
abstract class VacancyEvent {}

class GetVacancyListEvent extends VacancyEvent {
  final String? category;

  GetVacancyListEvent({this.category});
}

class GetMoreVacancyListEvent extends VacancyEvent {
  final String? category;

  GetMoreVacancyListEvent({this.category});
}

class GetTopOrganizationEvent extends VacancyEvent {}

class GetVacancyOptionEvent extends VacancyEvent {}

class GetOrganizationVacancyEvent extends VacancyEvent {
  final String? category;

  GetOrganizationVacancyEvent({this.category});
}

class GetMoreOrganizationVacancyEvent extends VacancyEvent {}

class GetCandidateListEvent extends VacancyEvent {}

class GetMoreCandidateList extends VacancyEvent {}

class GetCategoryListEvent extends VacancyEvent {}

class GetVacancyFilterEvent extends VacancyEvent {}
