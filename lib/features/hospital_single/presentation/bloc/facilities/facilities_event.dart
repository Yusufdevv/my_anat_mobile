part of 'facilities_bloc.dart';

@Freezed()
class FacilitiesEvent with _$FacilitiesEvent {
  factory FacilitiesEvent.getFacilities({required int organizationId}) = _GetFacilities;
  factory FacilitiesEvent.getMoreFacilities() = _GetMoreFacilities;
}
