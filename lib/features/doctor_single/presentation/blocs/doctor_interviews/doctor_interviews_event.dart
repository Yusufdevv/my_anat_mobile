part of 'doctor_interviews_bloc.dart';

@immutable
abstract class DoctorInterviewsEvent {}

class GetDoctorInterviews extends DoctorInterviewsEvent {
  final int doctorId;
  GetDoctorInterviews({required this.doctorId});
}

class GetMoreDoctorInterviews extends DoctorInterviewsEvent {}
