part of 'vacancy_search_bloc.dart';

@immutable
abstract class VacancySearchEvent {}

class GetVacancySearchEvent extends VacancySearchEvent {
  final String search;

  GetVacancySearchEvent({required this.search});
}

class GetCandidateSearchEvent extends VacancySearchEvent {
  final String? search;

  GetCandidateSearchEvent({required this.search});
}
