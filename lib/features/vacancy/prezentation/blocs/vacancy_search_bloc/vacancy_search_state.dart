part of 'vacancy_search_bloc.dart';

@immutable
class VacancySearchState extends Equatable {
  final List<VacancyListEntity> vacancyList;
  final FormzStatus status;
  final PaginatorStatus vacancyPaginatorStatus;
  final String? nextVacancy;
  final String? nextCandidate;
  final PaginatorStatus candidatePaginatorStatus;
  final bool fetchMoreVacancy;
  final bool fetchMoreCandidate;
  final List<CandidateListEntity> candidateList;

  const VacancySearchState({
    required this.vacancyList,
    required this.status,
    required this.candidatePaginatorStatus,
    required this.fetchMoreCandidate,
    required this.fetchMoreVacancy,
    required this.vacancyPaginatorStatus,
    this.nextCandidate,
    this.nextVacancy,
    required this.candidateList,
  });

  VacancySearchState copyWith(
          {List<VacancyListEntity>? vacancyList,
          FormzStatus? status,
          PaginatorStatus? candidatePaginatorStatus,
          String? nextVacancy,
          String? nextCandidate,
          PaginatorStatus? vacancyPaginatorStatus,
          bool? fetchMoreVacancy,
          bool? fetchMoreCandidate,
          List<CandidateListEntity>? candidateList}) =>
      VacancySearchState(
        vacancyList: vacancyList ?? this.vacancyList,
        status: status ?? this.status,
        candidatePaginatorStatus: candidatePaginatorStatus ?? this.candidatePaginatorStatus,
        fetchMoreCandidate: fetchMoreCandidate ?? this.fetchMoreCandidate,
        fetchMoreVacancy: fetchMoreVacancy ?? this.fetchMoreVacancy,
        vacancyPaginatorStatus: vacancyPaginatorStatus ?? this.vacancyPaginatorStatus,
        nextCandidate: nextCandidate,
        nextVacancy: nextVacancy,
        candidateList: candidateList ?? this.candidateList,
      );

  @override
  List<Object?> get props => [
        vacancyList,
        status,
        nextVacancy,
        nextCandidate,
        candidatePaginatorStatus,
        vacancyPaginatorStatus,
        fetchMoreVacancy,
        fetchMoreCandidate,
        candidateList,
      ];
}
