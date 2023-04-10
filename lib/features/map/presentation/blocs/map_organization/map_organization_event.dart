part of 'map_organization_bloc.dart';

@Freezed()
class MapOrganizationEvent with _$MapOrganizationEvent {
  factory MapOrganizationEvent.changeTab({
    required int tab,
    required BuildContext context,
    required double acuracy,
  }) = _ChangeTab;

  factory MapOrganizationEvent.getHospitals({
    required BuildContext context,
    double? latitude,
    double? longitude,
    double? radius,
  }) = _GetHospitals;
  factory MapOrganizationEvent.getDoctors({double? latitude, double? longitude, double? radius}) = _GetDoctors;
  factory MapOrganizationEvent.getTypes({required String searchText}) = _GetTypes;
  factory MapOrganizationEvent.getMoreTypes({required String searchText}) = _GetMoreTypes;
  factory MapOrganizationEvent.changeSearchText(String text) = _ChangeSearchText;
  factory MapOrganizationEvent.onMapCreated(
      {required YandexMapController controller,
      required int orgMapV2TabIndex,
      required BuildContext context}) = _OnMapCreated;
  factory MapOrganizationEvent.changeRadius({required int radius}) = _ChangeRadius;
  factory MapOrganizationEvent.getCurrentLocation(
      {required ValueChanged<String> onError,
      required ValueChanged<Position> onSuccess,
      required BuildContext context}) = _GetCurrentLocation;
  factory MapOrganizationEvent.changeLatLong({required double lat, required double long, int? radius}) = _ChangeLatLong;
}
