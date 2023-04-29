part of 'map_organization_bloc.dart';

abstract class MapEvent {}

class MapUnFocusAndClearControllerEvent extends MapEvent {
  final bool notUnFocus;
  MapUnFocusAndClearControllerEvent({this.notUnFocus = false});
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

  MapOnCreateEvent({
    required this.controller,
    required this.context,
  });
}

class MapChooseEvent extends MapEvent {
  final int? radius;
  final double? lat;
  final double? long;
  final bool? isGetFocus;
  final MapScreenStatus? screenStatus;
  MapChooseEvent({
    this.screenStatus,
    this.radius,
    this.lat,
    this.long,
    this.isGetFocus,
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

class MapGetMoreDoctorsEvent extends MapEvent {
  MapGetMoreDoctorsEvent();
}

class MapGetHospitalsEvent extends MapEvent {
  final BuildContext context;
  final String where;

  final bool notToLoading;

  MapGetHospitalsEvent({
    required this.where,
    required this.context,
    this.notToLoading = true,
  });
}

class MapGetMoreHospitalsEvent extends MapEvent {
  MapGetMoreHospitalsEvent();
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
