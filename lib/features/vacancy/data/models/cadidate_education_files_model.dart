import 'package:anatomica/features/vacancy/domain/entities/candidate_education_files_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cadidate_education_files_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CandidateEducationFilesModel extends CandidateEducationFilesEntity {
  const CandidateEducationFilesModel({
    required super.id,
    required super.document,
  });

  factory CandidateEducationFilesModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateEducationFilesModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DocumentFilesModel extends DocumentFilesEntity {
  const DocumentFilesModel({
    required super.name,
    required super.url,
    required super.size,
  });

  factory DocumentFilesModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentFilesModelFromJson(json);
}
