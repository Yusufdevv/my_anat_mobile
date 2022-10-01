part of 'region_bloc.dart';

abstract class RegionEvent {
  const RegionEvent();
}

class GetRegionEvent extends RegionEvent {}

class GetMoreRegion extends RegionEvent {}

class GetDistrictEvent extends RegionEvent {
  final int? id;
  final String selectedRegionName;
  GetDistrictEvent({this.id, required this.selectedRegionName});
}

class GetMoreDistrict extends RegionEvent {}
