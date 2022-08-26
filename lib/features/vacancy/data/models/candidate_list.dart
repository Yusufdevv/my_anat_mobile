import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
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
  });

  factory CandidateListModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateListModelFromJson(json);
}
