part of 'doctor_single_bloc.dart';

@immutable
abstract class DoctorSingleEvent {}

class GetDoctorSingle extends DoctorSingleEvent {
  final int id;
  GetDoctorSingle({required this.id});
}
