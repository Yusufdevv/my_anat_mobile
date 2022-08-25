part of 'vacancy_bloc.dart';

class VacancyState extends Equatable {
  final int currentPage;
  final int totalPages;
  final PaginatorStatus paginatorStatus;
  final bool fetchMore;
  final int count;
  final List<VacancyListEntity> vacancyList;
  final FormzStatus topOrganizationStatus;
  final TopOrganizationEntity topOrganizationEntity;
  final FormzStatus vacancyOptionStatus;
  final List<VacancyOptionEntity> vacancyOptionList;
  final FormzStatus organizationVacancyStatus;
  final int currentPageOrganization;
  final int totalPageOrganization;
  final bool fetchMoreOrganization;
  final PaginatorStatus paginatorStatusOrganization;
  final List<VacancyListEntity> organizationVacancyList;

  const VacancyState({
    required this.paginatorStatus,
    required this.count,
    required this.totalPages,
    required this.currentPage,
    required this.fetchMore,
    required this.vacancyList,
    required this.topOrganizationStatus,
    required this.topOrganizationEntity,
    required this.vacancyOptionStatus,
    required this.vacancyOptionList,
    required this.organizationVacancyStatus,
    required this.currentPageOrganization,
    required this.fetchMoreOrganization,
    required this.totalPageOrganization,
    required this.paginatorStatusOrganization,
    required this.organizationVacancyList,
  });

  VacancyState copyWith({
    int? currentPage,
    int? totalPages,
    PaginatorStatus? paginatorStatus,
    bool? fetchMore,
    int? count,
    List<VacancyListEntity>? vacancyList,
    FormzStatus? topOrganizationStatus,
    TopOrganizationEntity? topOrganizationEntity,
    FormzStatus? vacancyOptionStatus,
    List<VacancyOptionEntity>? vacancyOptionList,
    FormzStatus? organizationVacancyStatus,
    int? currentPageOrganization,
    int? totalPageOrganization,
    bool? fetchMoreOrganization,
    PaginatorStatus? paginatorStatusOrganization,
    List<VacancyListEntity>? organizationVacancyList,
  }) =>
      VacancyState(
        paginatorStatus: paginatorStatus ?? this.paginatorStatus,
        fetchMore: fetchMore ?? this.fetchMore,
        totalPages: totalPages ?? this.totalPages,
        currentPage: currentPage ?? this.currentPage,
        count: count ?? this.count,
        vacancyList: vacancyList ?? this.vacancyList,
        topOrganizationStatus: topOrganizationStatus ?? this.topOrganizationStatus,
        topOrganizationEntity: topOrganizationEntity ?? this.topOrganizationEntity,
        vacancyOptionStatus: vacancyOptionStatus ?? this.vacancyOptionStatus,
        vacancyOptionList: vacancyOptionList ?? this.vacancyOptionList,
        organizationVacancyStatus: organizationVacancyStatus ?? this.organizationVacancyStatus,
        currentPageOrganization: currentPageOrganization ?? this.currentPageOrganization,
        fetchMoreOrganization: fetchMoreOrganization ?? this.fetchMoreOrganization,
        totalPageOrganization: totalPageOrganization ?? this.totalPageOrganization,
        paginatorStatusOrganization:
            paginatorStatusOrganization ?? this.paginatorStatusOrganization,
        organizationVacancyList: organizationVacancyList ?? this.organizationVacancyList,
      );

  @override
  List<Object?> get props => [
        paginatorStatus,
        count,
        totalPages,
        currentPage,
        fetchMore,
        vacancyList,
        topOrganizationStatus,
        topOrganizationEntity,
        vacancyOptionStatus,
        vacancyOptionList,
        organizationVacancyStatus,
        currentPageOrganization,
        totalPageOrganization,
        fetchMoreOrganization,
        paginatorStatusOrganization,
        organizationVacancyList,
      ];
}
