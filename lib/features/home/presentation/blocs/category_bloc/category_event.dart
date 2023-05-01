part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.getCategories() = _GetCategories;
  const factory CategoryEvent.getMoreCategories() = _GetMoreCategories;
  const factory CategoryEvent.getOrganizations(int type) = _GetOrganizations;
  const factory CategoryEvent.getMoreOrganizations() = _GetMoreOrganizations;
  const factory CategoryEvent.changeCrossFade(CrossFadeState crossFade) = _ChangeCrossFade;
}
