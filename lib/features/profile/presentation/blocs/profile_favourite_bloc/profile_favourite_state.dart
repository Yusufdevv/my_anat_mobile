part of 'profile_favourite_bloc.dart';

class ProfileFavouriteState extends Equatable {
  final List<CandidateListEntity> likedCandidates;
  final List<VacancyListEntity> likedVacancies;
  final PaginatorStatus vacancyStatus;
  final PaginatorStatus candidateStatus;
  final bool vacancyFetchMore;
  final bool candidateFetchMore;
  final String? vacancyNext;
  final String? candidateNext;

  const ProfileFavouriteState({
    this.candidateFetchMore = false,
    this.candidateNext,
    this.candidateStatus = PaginatorStatus.PAGINATOR_INITIAL,
    this.likedCandidates = const [],
    this.likedVacancies = const [],
    this.vacancyFetchMore = false,
    this.vacancyNext,
    this.vacancyStatus = PaginatorStatus.PAGINATOR_INITIAL,
  });

  ProfileFavouriteState copyWith({
    List<CandidateListEntity>? likedCandidates,
    List<VacancyListEntity>? likedVacancies,
    PaginatorStatus? vacancyStatus,
    PaginatorStatus? candidateStatus,
    bool? vacancyFetchMore,
    bool? candidateFetchMore,
    String? vacancyNext,
    String? candidateNext,
  }) =>
      ProfileFavouriteState(
        likedCandidates: likedCandidates ?? this.likedCandidates,
        likedVacancies: likedVacancies ?? this.likedVacancies,
        vacancyStatus: vacancyStatus ?? this.vacancyStatus,
        candidateStatus: candidateStatus ?? this.candidateStatus,
        vacancyFetchMore: vacancyFetchMore ?? this.vacancyFetchMore,
        candidateFetchMore: candidateFetchMore ?? this.candidateFetchMore,
        vacancyNext: vacancyNext ?? this.vacancyNext,
        candidateNext: candidateNext ?? this.candidateNext,
      );

  @override
  List<Object?> get props => [
        likedCandidates,
        likedVacancies,
        vacancyStatus,
        candidateStatus,
        vacancyFetchMore,
        candidateFetchMore,
        vacancyNext,
        candidateNext,
      ];
}
