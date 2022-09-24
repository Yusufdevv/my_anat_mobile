part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationState with _$MapOrganizationState {
  factory MapOrganizationState({
    @Default([]) List<MapHospitalModel> hospitals,
    @Default([]) List<MapDoctorModel> doctors,
    @Default([]) List<TypeEntity> types,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(FormzStatus.pure) FormzStatus getTypesStatus,
    @Default('') String searchText,
    String? next,
    @Default(false) bool fetchMore,
  }) = _MapOrganizationState;
}
