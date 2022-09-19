part of 'doctor_articles_bloc.dart';

@immutable
abstract class DoctorArticlesEvent {}

class GetDoctorArticles extends DoctorArticlesEvent {
  final int doctorId;
  GetDoctorArticles({required this.doctorId});
}

class GetMoreDoctorArticles extends DoctorArticlesEvent {}
