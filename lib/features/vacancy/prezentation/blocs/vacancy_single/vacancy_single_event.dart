part of 'vacancy_single_bloc.dart';

@immutable
abstract class VacancySingleEvent {}

class GetSingleVacancyEvent extends VacancySingleEvent {
  final String slug;

  GetSingleVacancyEvent({required this.slug});
  }
