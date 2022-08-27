part of 'vacancy_single_bloc.dart';

class VacancySingleState extends Equatable {
  final FormzStatus status;
  final VacancyListEntity vacancyListEntity;
  final bool showNumber;
  final int totalPages;
  final int currentPage;
  final bool fetchMore;
  final PaginatorStatus paginatorStatus;
  final List<VacancyListEntity> relatedVacancyList;

  const VacancySingleState({
    required this.vacancyListEntity,
    required this.status,
    required this.showNumber,
    required this.paginatorStatus,
    required this.totalPages,
    required this.currentPage,
    required this.fetchMore,
    required this.relatedVacancyList,
  });

  VacancySingleState copyWith(
          {FormzStatus? status,
          VacancyListEntity? vacancyListEntity,
          bool? showNumber,
          PaginatorStatus? paginatorStatus,
          int? totalPages,
          int? currentPage,
          bool? fetchMore,
          List<VacancyListEntity>? relatedVacancyList}) =>
      VacancySingleState(
        vacancyListEntity: vacancyListEntity ?? this.vacancyListEntity,
        status: status ?? this.status,
        showNumber: showNumber ?? this.showNumber,
        paginatorStatus: paginatorStatus ?? this.paginatorStatus,
        totalPages: totalPages ?? this.totalPages,
        currentPage: currentPage ?? this.currentPage,
        fetchMore: fetchMore ?? this.fetchMore,
        relatedVacancyList: relatedVacancyList ?? this.relatedVacancyList,
      );

  @override
  List<Object?> get props => [
        status,
        vacancyListEntity,
        showNumber,
        paginatorStatus,
        totalPages,
        currentPage,
        fetchMore,
        relatedVacancyList
      ];
}
