import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/district.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'candidate_single.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CandidateSingleModel extends CandidateSingleEntity {
  const CandidateSingleModel(
      {required super.workHistory,
      required super.id,
      required super.position,
      required super.workExperience,
      required super.image,
      required super.rating,
      required super.address,
      required super.phoneNumber,
      required super.specialization,
      required super.telegram,
      required super.instagram,
      required super.district,
      required super.email,
      required super.region,
      required super.bio,
      required super.fullName,
      required super.img,
      required super.license,
      required super.moderationStatus,
      required super.openToWork,
      required super.showInProfileBio,
      required super.work});

  factory CandidateSingleModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateSingleModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkHistoryModel extends WorkHistory {
  const WorkHistoryModel({
    required super.position,
    required super.id,
    required super.organization,
    required super.startDate,
    required super.endDate,
    required super.isMain,
  });

  factory WorkHistoryModel.fromJson(Map<String, dynamic> json) => _$WorkHistoryModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LicenseModel extends LicenceEntity {
  const LicenseModel({
    required super.size,
    required super.url,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) => _$LicenseModelFromJson(json);
}
