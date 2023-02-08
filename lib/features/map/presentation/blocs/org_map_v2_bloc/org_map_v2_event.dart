part of 'org_map_v2_bloc.dart';

@freezed
class OrgMapV2Event with _$OrgMapV2Event {
  const factory OrgMapV2Event.suggestCategories({String? searchText}) =
      _SuggestCategories;
  const factory OrgMapV2Event.suggestServices({String? searchText}) =
      _SuggestServices;
  const factory OrgMapV2Event.suggestOrg({required MapV2Params params}) =
      _SuggestOrg;
  const factory OrgMapV2Event.getAllCategories({String? searchText}) =
      _GetAllCategories;
  const factory OrgMapV2Event.getAllServices({String? searchText}) =
      _GetAllServices;
}
