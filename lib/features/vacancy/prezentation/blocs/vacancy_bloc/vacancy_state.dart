part of 'vacancy_bloc.dart';

class VacancyState extends Equatable {
  final String? next;
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
  final String? candidateNext;
  final PaginatorStatus candidatePaginatorStatus;
  final bool fetchMoreCandidate;
  final List<CandidateListEntity> candidateList;
  final FormzStatus organizationStatus;
  final List<CategoryListEntity> categoryList;
  final FormzStatus categoryStatus;
  final List<VacancyOptionEntity> vacancyFilterList;
  final FormzStatus filterStatus;
  final List<String>? salaryKey;
  final List<String>? experienceKey;
  final List<int> districtList;
  final List<int> selectCategoryId;
  final bool fetchMoreCategories;
  final String? nextCategories;

  const VacancyState({
    required this.organizationNext,
    required this.paginatorStatus,
    required this.count,
    this.next,
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
    this.candidateNext,
    required this.candidateList,
    required this.candidatePaginatorStatus,
    required this.fetchMoreCandidate,
    required this.organizationStatus,
    required this.categoryList,
    required this.categoryStatus,
    required this.filterStatus,
    required this.vacancyFilterList,
    required this.fetchMoreCategories,
    required this.nextCategories,
    this.salaryKey,
    this.experienceKey,
    this.districtList = const [],
    this.selectCategoryId = const [],
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
    String? candidateNext,
    String? nextCategories,
    PaginatorStatus? candidatePaginatorStatus,
    bool? fetchMoreCandidate,
    bool? fetchMoreCategories,
    List<CandidateListEntity>? candidateList,
    FormzStatus? organizationStatus,
    List<CategoryListEntity>? categoryList,
    FormzStatus? categoryStatus,
    List<VacancyOptionEntity>? vacancyFilterList,
    FormzStatus? filterStatus,
    List<String>? salaryKey,
    List<String>? experienceKey,
    List<int>? districtList,
    List<int>? selectCategoryId,
  }) =>
      VacancyState(
        paginatorStatus: paginatorStatus ?? this.paginatorStatus,
        fetchMore: fetchMore ?? this.fetchMore,
        next: next,
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
        organizationCount: organizationCount ?? this.organizationCount,
        organizationNext: organizationNext ?? this.organizationNext,
        candidateNext: candidateNext,
        candidateList: candidateList ?? this.candidateList,
        candidatePaginatorStatus:
            candidatePaginatorStatus ?? this.candidatePaginatorStatus,
        fetchMoreCandidate: fetchMoreCandidate ?? this.fetchMoreCandidate,
        organizationStatus: organizationStatus ?? this.organizationStatus,
        categoryList: categoryList ?? this.categoryList,
        categoryStatus: categoryStatus ?? this.categoryStatus,
        filterStatus: filterStatus ?? this.filterStatus,
        vacancyFilterList: vacancyFilterList ?? this.vacancyFilterList,
        salaryKey: salaryKey ?? this.salaryKey,
        experienceKey: experienceKey ?? this.experienceKey,
        districtList: districtList ?? this.districtList,
        selectCategoryId: selectCategoryId ?? this.selectCategoryId,
        fetchMoreCategories: fetchMoreCategories ?? this.fetchMoreCategories,
        nextCategories: nextCategories ?? this.nextCategories,
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
        candidateNext,
        candidateList,
        candidatePaginatorStatus,
        fetchMoreCandidate,
        organizationStatus,
        categoryList,
        categoryStatus,
        filterStatus,
        vacancyFilterList,
        salaryKey,
        experienceKey,
        districtList,
        selectCategoryId,
        nextCategories,
        fetchMoreCategories,
      ];
}
