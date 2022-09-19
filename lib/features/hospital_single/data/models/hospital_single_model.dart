import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_certificate_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HospitalSingleModel extends HospitalSingleEntity {
  const HospitalSingleModel({
    required super.slug,
    required super.telegram,
    required super.email,
    required super.website,
    required super.instagram,
    required super.facebook,
    required super.images,
    required super.rating,
    required super.id,
    required super.address,
    required super.phoneNumber,
    required super.description,
    required super.title,
    required super.logo,
    required super.longitude,
    required super.latitude,
    required super.commentCount,
    required super.district,
    required super.region,
    required super.locationUrl,
    required super.phoneNumbers,
    required super.types,
    required super.specialization,
    required super.moderationStatus,
    required super.certificate,
    required super.workAllDay,
    required super.workFrom,
    required super.workTo,
  });

  factory HospitalSingleModel.fromJson(Map<String, dynamic> json) => _$HospitalSingleModelFromJson(json);
}
