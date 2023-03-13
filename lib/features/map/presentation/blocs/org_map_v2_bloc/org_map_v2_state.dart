part of 'org_map_v2_bloc.dart';

@Freezed()
class OrgMapV2State with _$OrgMapV2State {
  factory OrgMapV2State({
    @Default([]) List<OrgMapV2Model> hospitals,
    @Default([]) List<TypeModel> types,
    @Default([]) List<ServiceSpecSuggestModel> services,
    @Default(FormzStatus.pure) getAllHospitalsStatus,
    @Default(FormzStatus.pure) getSuggestHospitalsStatus,
    @Default(FormzStatus.pure) serviceStatus,
    @Default(FormzStatus.pure) categoryStatus,
    @Default(0) hospitalsCount,
    @Default(0) typesCount,
    @Default(0) servicesCount,
    String? hospitalsPrevious,
    String? typesPrevious,
    String? servicesPrevious,
    String? hospitalsNext,
    String? typesNext,
    String? servicesNext,
    @Default(false) bool hospitalsFetchMore,
    @Default(false) bool typesFetchMore,
    @Default(false) bool servicesFetchMore,
    @Default(0) tabIndex,
  }) = _OrgMapV2State;
}
