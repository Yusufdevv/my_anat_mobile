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

class LikeUnlikeVacancyEvent extends VacancySearchEvent {
  final VacancyListEntity vacancy;
  LikeUnlikeVacancyEvent({required this.vacancy});
}

class LikeUnlikeCandidateEvent extends VacancySearchEvent {
  final CandidateListEntity candidate;
  LikeUnlikeCandidateEvent({required this.candidate});
}
