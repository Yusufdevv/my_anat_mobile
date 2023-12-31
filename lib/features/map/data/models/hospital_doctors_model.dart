import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/phone_number2_model.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital_doctors_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HospitalDoctorsModel extends HospitalDoctorsEntity {
  const HospitalDoctorsModel({
    required super.fullName,
    required super.doctorName,
    required super.id,
    required super.phoneNumber,
    required super.specializations,
    required super.isFavourite,
    required super.image,
    required super.position,
    required super.rating,
    required super.address,
    required super.workExperience,
    required super.distance,
    required super.imgIsFull,
    required super.latitude,
    required super.longitude,
    required super.phoneNumbers,
    required super.organizationName,
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
