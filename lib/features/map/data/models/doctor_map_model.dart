import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:anatomica/features/map/domain/entities/doctor_map_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'doctor_map_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class DoctorMapModel extends DoctorMapEntity {
  const DoctorMapModel({
    required super.address,
    required super.distance,
    required super.fullName,
    required super.doctorName,
    required super.specializations,
    required super.id,
    required super.image,
    required super.imgIsFull,
    required super.latitude,
    required super.longitude,
    required super.organizationName,
    required super.phoneNumbers,
    required super.position,
    required super.rating,
  });
  factory DoctorMapModel.fromJson(Map<String, dynamic> json) => _$DoctorMapModelFromJson(json);
}
