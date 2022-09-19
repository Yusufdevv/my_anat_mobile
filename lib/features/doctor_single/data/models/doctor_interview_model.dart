import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_interview_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_interview_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DoctorInterviewModel extends DoctorInterviewEntity {
  const DoctorInterviewModel({
    required super.id,
    required super.title,
    required super.url,
    required super.slug,
    required super.image,
    required super.description,
    required super.viewCount,
    required super.content,
    required super.doctors,
    required super.isActive,
    required super.videoDuration,
  });
  factory DoctorInterviewModel.fromJson(Map<String, dynamic> json) => _$DoctorInterviewModelFromJson(json);
}
