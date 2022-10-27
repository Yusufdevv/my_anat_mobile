part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationState with _$MapOrganizationState {
  factory MapOrganizationState({
    @Default([]) List<MapHospitalModel> hospitals,
    @Default([]) List<MapDoctorModel> doctors,
    @Default([]) List<TypeEntity> types,
    @Default(0) int radius,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus getTypesStatus,
    @Default(FormzStatus.pure) FormzStatus getCurrentLocationStatus,
    @Default(0) double lat,
    @Default(0) double long,
    @Default(0) double currentLat,
    @Default(0) double currentLong,
    @Default('') String searchText,
    String? next,
    @Default(false) bool fetchMore,
  }) = _MapOrganizationState;
}
