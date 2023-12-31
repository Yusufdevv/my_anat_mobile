part of 'vacancy_bloc.dart';

@immutable
abstract class VacancyEvent {}

class GetVacancyListEvent extends VacancyEvent {
  final VacancyParamsEntity? vacancyParamsEntity;
  final Function onSuccess;

  GetVacancyListEvent({required this.onSuccess, this.vacancyParamsEntity});
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
  final CandidateListParams? params;
  final VoidCallback? onSuccess;

  GetCandidateListEvent({
    this.categoryId,
    this.params,
    this.onSuccess,
  });
}

class GetMoreCandidateList extends VacancyEvent {}

class GetCategoryListEvent extends VacancyEvent {}
class GetMoreCategoryListEvent extends VacancyEvent {}

class GetVacancyFilterEvent extends VacancyEvent {}

class SelectSalaryFilterEvent extends VacancyEvent {
  final List<String>? salaryKey;
  final Function onSuccess;

  SelectSalaryFilterEvent({this.salaryKey, required this.onSuccess});
}

class SelectExperienceEvent extends VacancyEvent {
  final List<String>? experienceKey;
  final Function onSuccess;

  SelectExperienceEvent({required this.onSuccess, this.experienceKey});
}

class SelectDistrictEvent extends VacancyEvent {
  final List<int>? districtList;
  final Function onSuccess;

  SelectDistrictEvent({required this.onSuccess, this.districtList});
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

class LikeUnlikeVacancy extends VacancyEvent {
  final VacancyListEntity vacancy;

  LikeUnlikeVacancy({required this.vacancy});
}

class LikeUnlikeCandidate extends VacancyEvent {
  final CandidateListEntity candidate;

  LikeUnlikeCandidate({required this.candidate});
}

class SelectCategoryEvent extends VacancyEvent {
  final List<int> id;
  SelectCategoryEvent({required this.id});
}
