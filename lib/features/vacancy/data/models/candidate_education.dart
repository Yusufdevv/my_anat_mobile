import 'package:anatomica/features/vacancy/domain/entities/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:json_annotation/json_annotation.dart';

part 'candidate_education.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CandidateEducationModel extends CandidateEducationEntity {
  const CandidateEducationModel({
    required super.university,
    required super.id,
    required super.endDate,
    required super.startDate,
    required super.degree,
    required super.faculty,
  });

  factory CandidateEducationModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateEducationModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UniversityModel extends University {
  const UniversityModel({
    required super.id,
    required super.title,
    required super.logo,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) => _$UniversityModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FacultyModel extends FacultyEntity {
  const FacultyModel({
    required super.title,
    required super.id,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) => _$FacultyModelFromJson(json);
}
