part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationEvent with _$MapOrganizationEvent {
  factory MapOrganizationEvent.getHospitals(
      {double? latitude, double? longitude, double? radius}) = _GetHospitals;

  factory MapOrganizationEvent.getDoctors(
      {double? latitude, double? longitude, double? radius}) = _GetDoctors;

  factory MapOrganizationEvent.getTypes({required String searchText}) =
      _GetTypes;

  factory MapOrganizationEvent.getMoreTypes({required String searchText}) =
      _GetMoreTypes;

  factory MapOrganizationEvent.changeSearchText(String text) =
      _ChangeSearchText;

  factory MapOrganizationEvent.changeRadius({required int radius}) =
      _ChangeRadius;

  factory MapOrganizationEvent.getCurrentLocation(
      {required ValueChanged<String> onError,
      required ValueChanged<Position> onSuccess}) = _GetCurrentLocation;

  factory MapOrganizationEvent.changeLatLong(
      {required double lat,
      required double long,
      int? radius}) = _ChangeLatLong;
}
