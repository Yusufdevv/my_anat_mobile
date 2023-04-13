part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationState with _$MapOrganizationState {
  factory MapOrganizationState({
    @Default([]) List<OrgMapV2Model> hospitals,
    @Default([]) List<DoctorMapEntity> doctors,
    @Default([]) List<TypeEntity> types,
    @Default(0) int typesCount,
    String? typesNext,
    @Default([]) List<MapObject<dynamic>> mapObjects,
    @Default(FormzStatus.pure) FormzStatus typesStatus,
    @Default(FormzStatus.pure) FormzStatus tabChangingStatus,
    @Default(false) bool typesFetchMore,
    @Default(0) int radius,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus getTypesStatus,
    @Default(FormzStatus.pure) FormzStatus getCurrentLocationStatus,
    @Default(0) double maxZoomLevel,
    @Default(0) double minZoomLevel,
    @Default(0) double lat,
    @Default(0) double long,
    @Default(0) double currentLat,
    @Default(0) double currentLong,
    @Default(0) double accuracy,
    @Default('') String searchText,
    String? next,
    @Default(false) bool fetchMore,
    @Default(null) YandexMapController? mapController,
    @Default(null) TabController? tabController,
  }) = _MapOrganizationState;
}
