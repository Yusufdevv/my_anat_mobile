import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/data/models/license_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/license_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.region,
    required super.id,
    required super.phoneNumber,
    required super.img,
    required super.fullName,
    required super.email,
    required super.rating,
    required super.address,
    required super.specialization,
    required super.workExperience,
    required super.work,
    required super.showInProfileBio,
    required super.openToWork,
    required super.moderationStatus,
    required super.license,
    required super.district,
    required super.bio,
    required super.position,
    required super.instagram,
    required super.telegram,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}

class DoctorConverter implements JsonConverter<DoctorEntity, Map<String, dynamic>?> {
  const DoctorConverter();
  @override
  DoctorEntity fromJson(Map<String, dynamic>? json) => DoctorModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DoctorEntity object) => {};
}
