part of 'map_organization_bloc.dart';

abstract class MapEvent {}

class MapUnFocusAndClearControllerEvent extends MapEvent {
  final bool notUnFocus;
  MapUnFocusAndClearControllerEvent({this.notUnFocus = false});
}

class MapGetSuggestionsEvent extends MapEvent {
  final String text;

  MapGetSuggestionsEvent({required this.text});
}

class MapGetSpecializationsEvent extends MapEvent {
  MapGetSpecializationsEvent();
}

class MapGetHospitalsWithDistance extends MapEvent {
  final String search;
  final Point myPoint;

  MapGetHospitalsWithDistance({required this.search, required this.myPoint});
}

class MapGetMoreHospitalsWithDistanceEvent extends MapEvent {
  MapGetMoreHospitalsWithDistanceEvent();
}

class MapGetCurrentLocationEvent extends MapEvent {
  final ValueChanged<String> onError;
  final BuildContext context;

  MapGetCurrentLocationEvent({
    required this.onError,
    required this.context,
  });
}

class MapZoomOut extends MapEvent {
  MapZoomOut();
}

class MapZoomIn extends MapEvent {
  MapZoomIn();
}

class MapOnCreateEvent extends MapEvent {
  final YandexMapController controller;
  final BuildContext context;
  final Function(Point) onSuccess;

  MapOnCreateEvent({
    required this.controller,
    required this.context,
    required this.onSuccess,
  });
}

class MapChooseEvent extends MapEvent {
  final String? searchText;
  final int? radius;
  final double? lat;
  final double? long;
  final bool? isGetFocus;
  final MapScreenStatus? screenStatus;
  MapChooseEvent({
    this.screenStatus,
    this.searchText,
    this.radius,
    this.lat,
    this.long,
    this.isGetFocus,
  });
}

class MapGetMoreTypesEvent extends MapEvent {
  final String searchText;

  MapGetMoreTypesEvent({
    required this.searchText,
  });
}

class MapGetTypesEvent extends MapEvent {
  final String searchText;

  MapGetTypesEvent({
    required this.searchText,
  });
}

class MapGetDoctorsEvent extends MapEvent {
  double? latitude;
  double? longitude;
  double? radius;
  final BuildContext context;

  MapGetDoctorsEvent({
    required this.context,
    this.latitude,
    this.longitude,
    this.radius,
  });
}

class MapGetHospitalsEvent extends MapEvent {
  final BuildContext context;
  final String? search;
  final String? region;
  final String? district;
  final int? specializationId;
  final String? service;
  final int? limit;
  final int? offset;
  final double latitude;
  final double longitude;
  final String? title;
  final String? next;
  final String? previous;
  final double radius;

  MapGetHospitalsEvent({
    required this.context,
    required this.search,
    required this.radius,
    required this.latitude,
    required this.longitude,
    this.title,
    this.service,
    this.next,
    this.district,
    this.region,
    this.previous,
    this.offset,
    this.limit,
    this.specializationId,
  });
}

class MapChangeTabEvent extends MapEvent {
  final int tab;
  final BuildContext context;
  final double acuracy;
  final bool haveToLoading;

  MapChangeTabEvent({
    required this.tab,
    required this.context,
    required this.haveToLoading,
    required this.acuracy,
  });
}
