part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationEvent with _$MapOrganizationEvent {
  factory MapOrganizationEvent.getHospitals({required MapParameter param}) = _GetHospitals;
  factory MapOrganizationEvent.getDoctors({required MapParameter param}) = _GetDoctors;
  factory MapOrganizationEvent.getTypes() = _GetTypes;
  factory MapOrganizationEvent.getMoreTypes() = _GetMoreTypes;
  factory MapOrganizationEvent.changeSearchText(String text) = _ChangeSearchText;
}
