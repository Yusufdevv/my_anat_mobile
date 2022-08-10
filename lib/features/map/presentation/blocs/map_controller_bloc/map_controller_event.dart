part of 'map_controller_bloc.dart';

@immutable
abstract class MapControllerEvent {}

class GetPoints extends MapControllerEvent {}

class GetDoctorPoints extends MapControllerEvent {}
