import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/district.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CandidateSingleEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String fullName;
  @JsonKey(defaultValue: '')
  final String image;
  @PositionEntityConverter()
  final PositionEntity position;
  @JsonKey(defaultValue: 0)
  final int workExperience;
  @JsonKey(defaultValue: '')
  final String work;
  @WorkHistoryConverter()
  final WorkHistory workHistory;
  @RegionEntityConverter()
  final RegionEntity region;
  @DistrictEntityConverter()
  final DistrictEntity district;
  @JsonKey(defaultValue: '')
  final String address;
  @SpecializationConverter()
  final SpecializationEntity specialization;
  @JsonKey(defaultValue: '')
  final String phoneNumber;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: 0)
  final double rating;
  @JsonKey(defaultValue: false)
  final bool openToWork;
  @JsonKey(defaultValue: '')
  final String bio;
  @JsonKey(defaultValue: false)
  final bool showInProfileBio;
  @LicenceEntityConverter()
  final LicenceEntity license;
  @JsonKey(defaultValue: '')
  final String instagram;
  @JsonKey(defaultValue: '')
  final String telegram;
  @JsonKey(defaultValue: '')
  final String moderationStatus;
  @ImageConverter()
  final ImageEntity img;

  const CandidateSingleEntity({
    required this.workHistory,
    required this.id,
    required this.position,
    required this.workExperience,
    required this.image,
    required this.rating,
    required this.address,
    required this.phoneNumber,
    required this.specialization,
    required this.telegram,
    required this.instagram,
    required this.district,
    required this.email,
    required this.region,
    required this.bio,
    required this.fullName,
    required this.img,
    required this.license,
    required this.moderationStatus,
    required this.openToWork,
    required this.showInProfileBio,
    required this.work,
  });

  @override
  List<Object?> get props => [
        workHistory,
        id,
        position,
        workExperience,
        image,
        rating,
        address,
        phoneNumber,
        specialization,
        telegram,
        instagram,
        district,
        email,
        region,
        bio,
        fullName,
        img,
        license,
        moderationStatus,
        openToWork,
        showInProfileBio,
        work,
      ];
}

class WorkHistory extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @OrganizationEntityConverter()
  final OrganizationEntity organization;
  @JsonKey(defaultValue: {})
  final Map<String, dynamic> position;
  @JsonKey(defaultValue: '')
  final String startDate;
  @JsonKey(defaultValue: '')
  final String endDate;
  @JsonKey(defaultValue: false)
  final bool isMain;

  const WorkHistory({
    required this.position,
    required this.id,
    required this.organization,
    required this.startDate,
    required this.endDate,
    required this.isMain,
  });

  @override
  List<Object?> get props => [
        position,
        id,
        organization,
        startDate,
        endDate,
        isMain,
      ];
}

class WorkHistoryConverter extends JsonConverter<WorkHistory, Map<String, dynamic>?> {
  const WorkHistoryConverter();

  @override
  WorkHistory fromJson(Map<String, dynamic>? json) => WorkHistoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(WorkHistory object) => {};
}

class LicenceEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final String url;
  @JsonKey(defaultValue: 0)
  final int size;

  const LicenceEntity({this.size = 0, this.url = ''});

  @override
  List<Object?> get props => [url, size];
}

class LicenceEntityConverter extends JsonConverter<LicenceEntity, Map<String, dynamic>?> {
  const LicenceEntityConverter();

  @override
  LicenceEntity fromJson(Map<String, dynamic>? json) => LicenseModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(LicenceEntity object) => {};
}

class PositionEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  const PositionEntity({this.title = '', this.id = 0});

  @override
  List<Object?> get props => [title, id];
}

class PositionEntityConverter extends JsonConverter<PositionEntity, Map<String, dynamic>?> {
  const PositionEntityConverter();

  @override
  PositionEntity fromJson(Map<String, dynamic>? json) => PositionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(PositionEntity object) => {};
}
