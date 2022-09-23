import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital_doctors_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HospitalDoctorsModel extends HospitalDoctorsEntity {
  HospitalDoctorsModel({
    required super.fullName,
    required super.id,
    required super.phoneNumber,
    required super.specialization,
    required super.isFavourite,
    required super.image,
    required super.position,
    required super.rating,
    required super.address,
    required super.workExperience,
  });

  factory HospitalDoctorsModel.fromJson(Map<String, dynamic> json) => _$HospitalDoctorsModelFromJson(json);
}

class HospitalDoctorsConverter implements JsonConverter<HospitalDoctorsEntity, Map<String, dynamic>?> {
  const HospitalDoctorsConverter();
  @override
  HospitalDoctorsEntity fromJson(Map<String, dynamic>? json) => HospitalDoctorsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(HospitalDoctorsEntity object) => {};
}