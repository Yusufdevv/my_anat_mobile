part of 'region_bloc.dart';

abstract class RegionEvent {
  const RegionEvent();
}

class GetRegionEvent extends RegionEvent {}

class GetDistrictEvent extends RegionEvent {}
