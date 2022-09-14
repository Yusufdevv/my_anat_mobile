part of 'region_bloc.dart';

abstract class RegionEvent {
  const RegionEvent();
}

class GetRegionEvent extends RegionEvent {}

class GetMoreRegion extends RegionEvent {}

class GetDistrictEvent extends RegionEvent {
  final int? id;

  GetDistrictEvent({this.id});
}

class GetMoreDistrict extends RegionEvent {}
