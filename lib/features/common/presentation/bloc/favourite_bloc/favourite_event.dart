part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class LikeUnlikeVacancy extends FavouriteEvent {
  final VacancyListEntity vacancy;

  LikeUnlikeVacancy({required this.vacancy});
}

class LikeUnlikeCandidate extends FavouriteEvent {
  final CandidateListEntity candidate;

  LikeUnlikeCandidate({required this.candidate});
}
