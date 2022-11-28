import 'package:anatomica/features/vacancy/data/models/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CandidateEducationEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @UniversityConverter()
  final String place;
  @FacultyEntityConverter()
  final String course;
  @JsonKey(defaultValue: '')
  final String degree;
  @JsonKey(defaultValue: '')
  final String startDate;
  @JsonKey(defaultValue: '')
  final String endDate;

  const CandidateEducationEntity({
    required this.place,
    required this.id,
    required this.endDate,
    required this.startDate,
    required this.degree,
    required this.course,
  });

  @override
  List<Object?> get props => [place, id, endDate, startDate, degree, course];
}

class University extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @LogoEntityConverter()
  final LogoEntity logo;

  const University({required this.id, required this.title, required this.logo});

  @override
  List<Object?> get props => [id, title, logo];
}

class UniversityConverter extends JsonConverter<University, Map<String, dynamic>?> {
  const UniversityConverter();

  @override
  University fromJson(Map<String, dynamic>? json) => UniversityModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(University object) => {};
}

class FacultyEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;

  const FacultyEntity({required this.title, required this.id});

  @override
  List<Object?> get props => [id, title];
}

class FacultyEntityConverter extends JsonConverter<FacultyEntity, Map<String, dynamic>?> {
  const FacultyEntityConverter();

  @override
  FacultyEntity fromJson(Map<String, dynamic>? json) => FacultyModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(FacultyEntity object) => {};
}
