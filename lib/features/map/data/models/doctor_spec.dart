import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/map/domain/entities/doctor_spec_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_spec.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DoctorSpecModel extends DoctorSpecEntity {
  DoctorSpecModel({
    required super.fullName,
    required super.id,
    required super.phoneNumber,
    required super.specialization,
    required super.isFavourite,
    required super.position,
    required super.rating,
    required super.address,
    required super.workExperience,
    required super.image,
  });

  factory DoctorSpecModel.fromJson(Map<String, dynamic> json) => _$DoctorSpecModelFromJson(json);
}

class DoctorSpecConverter implements JsonConverter<DoctorSpecEntity, Map<String, dynamic>?> {
  const DoctorSpecConverter();
  @override
  DoctorSpecEntity fromJson(Map<String, dynamic>? json) => DoctorSpecModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(DoctorSpecEntity object) => {};
}
