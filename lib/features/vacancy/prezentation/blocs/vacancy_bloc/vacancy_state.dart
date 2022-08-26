part of 'vacancy_bloc.dart';

class VacancyState extends Equatable {
  final String next;
  final PaginatorStatus paginatorStatus;
  final bool fetchMore;
  final int count;
  final int organizationCount;
  final List<VacancyListEntity> vacancyList;
  final FormzStatus topOrganizationStatus;
  final TopOrganizationEntity topOrganizationEntity;
  final FormzStatus vacancyOptionStatus;
  final List<VacancyOptionEntity> vacancyOptionList;
  final FormzStatus organizationVacancyStatus;
  final String organizationNext;
  final bool fetchMoreOrganization;
  final PaginatorStatus paginatorStatusOrganization;
  final List<VacancyListEntity> organizationVacancyList;

  const VacancyState({
    required this.organizationNext,
    required this.paginatorStatus,
    required this.count,
    required this.next,
    required this.fetchMore,
    required this.vacancyList,
    required this.topOrganizationStatus,
    required this.topOrganizationEntity,
    required this.vacancyOptionStatus,
    required this.vacancyOptionList,
    required this.organizationVacancyStatus,
    required this.fetchMoreOrganization,
    required this.organizationCount,
    required this.paginatorStatusOrganization,
    required this.organizationVacancyList,
  });

  VacancyState copyWith({
    String? next,
    String? organizationNext,
    PaginatorStatus? paginatorStatus,
    bool? fetchMore,
    int? count,
    List<VacancyListEntity>? vacancyList,
    FormzStatus? topOrganizationStatus,
    TopOrganizationEntity? topOrganizationEntity,
    FormzStatus? vacancyOptionStatus,
    List<VacancyOptionEntity>? vacancyOptionList,
    FormzStatus? organizationVacancyStatus,
    int? organizationCount,
    bool? fetchMoreOrganization,
    PaginatorStatus? paginatorStatusOrganization,
    List<VacancyListEntity>? organizationVacancyList,
  }) =>
      VacancyState(
        paginatorStatus: paginatorStatus ?? this.paginatorStatus,
        fetchMore: fetchMore ?? this.fetchMore,
        next: next ?? this.next,
        count: count ?? this.count,
        vacancyList: vacancyList ?? this.vacancyList,
        topOrganizationStatus:
            topOrganizationStatus ?? this.topOrganizationStatus,
        topOrganizationEntity:
            topOrganizationEntity ?? this.topOrganizationEntity,
        vacancyOptionStatus: vacancyOptionStatus ?? this.vacancyOptionStatus,
        vacancyOptionList: vacancyOptionList ?? this.vacancyOptionList,
        organizationVacancyStatus:
            organizationVacancyStatus ?? this.organizationVacancyStatus,
        fetchMoreOrganization:
            fetchMoreOrganization ?? this.fetchMoreOrganization,
        paginatorStatusOrganization:
            paginatorStatusOrganization ?? this.paginatorStatusOrganization,
        organizationVacancyList:
            organizationVacancyList ?? this.organizationVacancyList,
        organizationCount: organizationCount ?? this.organizationCount, organizationNext: organizationNext??this.organizationNext,
      );

  @override
  List<Object?> get props => [
        paginatorStatus,
        count,
        next,
        fetchMore,
        vacancyList,
        topOrganizationStatus,
        topOrganizationEntity,
        vacancyOptionStatus,
        vacancyOptionList,
        organizationVacancyStatus,
        organizationCount,
        fetchMoreOrganization,
        paginatorStatusOrganization,
        organizationVacancyList,
      ];
}
