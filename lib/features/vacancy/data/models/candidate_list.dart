import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'candidate_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CandidateListModel extends CandidateListEntity {
  const CandidateListModel({
    required super.specialization,
    required super.phoneNumber,
    required super.address,
    required super.id,
    required super.rating,
    required super.image,
    required super.fullName,
    required super.position,
    required super.workExperience,
    required super.isFavorite,
  });

  factory CandidateListModel.fromJson(Map<String, dynamic> json) => _$CandidateListModelFromJson(json);
}
