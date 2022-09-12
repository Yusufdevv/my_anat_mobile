part of 'profile_favourite_bloc.dart';

@immutable
abstract class ProfileFavouriteEvent {}

class GetLikedVacancies extends ProfileFavouriteEvent {}

class GetMoreLikedVacancies extends ProfileFavouriteEvent {}

class GetLikedCandidates extends ProfileFavouriteEvent {}

class GetMoreLikedCandidates extends ProfileFavouriteEvent {}

class AddRemoveLikedVacancies extends ProfileFavouriteEvent {
  final VacancyListEntity vacancy;
  AddRemoveLikedVacancies({required this.vacancy});
}

class AddRemoveLikedCandidates extends ProfileFavouriteEvent {
  final CandidateListEntity candidate;
  AddRemoveLikedCandidates({required this.candidate});
}
