part of 'facilities_bloc.dart';

@Freezed()
 class FacilitiesEvent with _$FacilitiesEvent  {
   factory FacilitiesEvent.getFacilities({int? organizationId})=_GetFacilities;
 }
