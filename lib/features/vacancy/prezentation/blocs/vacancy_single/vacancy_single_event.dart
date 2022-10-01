part of 'vacancy_single_bloc.dart';

@immutable
abstract class VacancySingleEvent {}

class GetSingleVacancyEvent extends VacancySingleEvent {
  final String slug;

  GetSingleVacancyEvent({required this.slug});
}

class ShowNumberEvent extends VacancySingleEvent {}

class GetRelatedVacancyList extends VacancySingleEvent {
  final String slug;

  GetRelatedVacancyList({required this.slug});
}

class GetMoreRelatedVacancyList extends VacancySingleEvent {}

class LikeUnlikeVacancy extends VacancySingleEvent {
  final VacancyListEntity vacancy;
  LikeUnlikeVacancy({required this.vacancy});
}
