part of 'vacancy_bloc.dart';

@immutable
abstract class VacancyEvent {}

class GetVacancyListEvent extends VacancyEvent {
  final VacancyParamsEntity? vacancyParamsEntity;
  final Function? onSuccess;

  GetVacancyListEvent({this.onSuccess, this.vacancyParamsEntity});
}

class GetMoreVacancyListEvent extends VacancyEvent {
  final VacancyParamsEntity? vacancyParamsEntity;

  GetMoreVacancyListEvent({this.vacancyParamsEntity});
}

class GetTopOrganizationEvent extends VacancyEvent {}

class GetVacancyOptionEvent extends VacancyEvent {}

class GetOrganizationVacancyEvent extends VacancyEvent {
  final String? category;

  GetOrganizationVacancyEvent({this.category});
}

class GetMoreOrganizationVacancyEvent extends VacancyEvent {}

class GetCandidateListEvent extends VacancyEvent {
  final String? categoryId;

  GetCandidateListEvent({this.categoryId});
}

class GetMoreCandidateList extends VacancyEvent {}

class GetCategoryListEvent extends VacancyEvent {}

class GetVacancyFilterEvent extends VacancyEvent {}

class SelectSalaryFilterEvent extends VacancyEvent {
  final String? salaryKey;
  final Function onSuccess;

  SelectSalaryFilterEvent({this.salaryKey, required this.onSuccess});
}

class SelectExperienceEvent extends VacancyEvent {
  final String? experienceKey;
  final Function onSuccess;

  SelectExperienceEvent({required this.onSuccess, this.experienceKey});
}

class AddWishListVacancyEvent extends VacancyEvent {
  final int user;
  final int vacancy;
  final Function(String text) onSuccess;
  final Function onError;
  final bool isFavourite;

  AddWishListVacancyEvent({
    required this.vacancy,
    required this.user,
    required this.onSuccess,
    required this.onError,
    required this.isFavourite,
  });
}
