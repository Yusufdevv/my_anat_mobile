import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/organization_model.dart';
import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/organization_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DoctorSingleModel extends DoctorSingleEntity {
  const DoctorSingleModel({
    required super.rating,
    required super.phoneNumber,
    required super.email,
    required super.id,
    required super.moderationStatus,
    required super.position,
    required super.fullName,
    required super.workExperience,
    required super.address,
    required super.specializations,
    required super.region,
    required super.district,
    required super.img,
    required super.telegram,
    required super.instagram,
    required super.bio,
    required super.openToWork,
    required super.showInProfileBio,
    required super.work,
    required super.licence,
    required super.commentCount,
    required super.organization,
    required super.phoneNumbers,
  });
  factory DoctorSingleModel.fromJson(Map<String, dynamic> json) => _$DoctorSingleModelFromJson(json);
}
