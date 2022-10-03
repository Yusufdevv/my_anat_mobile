part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationEvent with _$MapOrganizationEvent {
  factory MapOrganizationEvent.getHospitals() = _GetHospitals;
  factory MapOrganizationEvent.getDoctors() = _GetDoctors;
  factory MapOrganizationEvent.getTypes() = _GetTypes;
  factory MapOrganizationEvent.getMoreTypes() = _GetMoreTypes;
  factory MapOrganizationEvent.changeSearchText(String text) = _ChangeSearchText;
  factory MapOrganizationEvent.changeRadius({required int radius}) = _ChangeRadius;
  factory MapOrganizationEvent.changeLatLong({required double lat, required double long,int? radius}) = _ChangeLatLong;
}
