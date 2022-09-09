import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:json_annotation/json_annotation.dart';
part 'candidate_work.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CandidateWorkModel extends CandidateWorkEntity {
  const CandidateWorkModel({
    required super.organization,
    required super.id,
    required super.startDate,
    required super.endDate,
    required super.position,
    required super.isMain,
  });

  factory CandidateWorkModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateWorkModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CandidateOrganizationModel extends CandidateOrganization {
  const CandidateOrganizationModel({
    required super.id,
    required super.title,
    required super.logo,
    required super.slug,
    required super.address,
    required super.rating,
    required super.specialization,
    required super.phoneNumbers,
    required super.types,
    required super.locationUrl,
    required super.images,
    required super.workAllDay,
  });

  factory CandidateOrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateOrganizationModelFromJson(json);
}
