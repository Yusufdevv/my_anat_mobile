import 'package:anatomica/features/doctor_single/domain/entities/doctor_comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_comment.g.dart';

@JsonSerializable()
class DoctorCommentModel extends DoctorCommentEntity {
  const DoctorCommentModel({
    required super.comment,
    required super.rating,
    required super.id,
    required super.doctor,
  });

  factory DoctorCommentModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorCommentModelFromJson(json);
}
