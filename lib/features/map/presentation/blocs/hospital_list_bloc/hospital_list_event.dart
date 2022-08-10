part of 'hospital_list_bloc.dart';

@immutable
abstract class HospitalListEvent {}

class ChangeScreenState extends HospitalListEvent {
  final CrossFadeState crossFadeState;
  ChangeScreenState({required this.crossFadeState});
}
