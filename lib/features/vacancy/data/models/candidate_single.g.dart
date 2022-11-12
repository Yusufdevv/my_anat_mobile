// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_single.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateSingleModel _$CandidateSingleModelFromJson(
        Map<String, dynamic> json) =>
    CandidateSingleModel(
      workHistory: const WorkHistoryConverter()
          .fromJson(json['work_history'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      position: const PositionEntityConverter()
          .fromJson(json['position'] as Map<String, dynamic>?),
      workExperience: json['work_experience'] as int? ?? 0,
      image: json['image'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => const PhoneNumberConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      specialization: const SpecializationConverter()
          .fromJson(json['specialization'] as Map<String, dynamic>?),
      telegram: json['telegram'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      district: const DistrictEntityConverter()
          .fromJson(json['district'] as Map<String, dynamic>?),
      email: json['email'] as String? ?? '',
      region: const RegionEntityConverter()
          .fromJson(json['region'] as Map<String, dynamic>?),
      bio: json['bio'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      img:
          const ImageConverter().fromJson(json['img'] as Map<String, dynamic>?),
      license: const LicenceEntityConverter()
          .fromJson(json['license'] as Map<String, dynamic>?),
      moderationStatus: json['moderation_status'] as String? ?? '',
      openToWork: json['open_to_work'] as bool? ?? false,
      showInProfileBio: json['show_in_profile_bio'] as bool? ?? false,
      work: json['work'] as String? ?? '',
    );

Map<String, dynamic> _$CandidateSingleModelToJson(
        CandidateSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'image': instance.image,
      'position': const PositionEntityConverter().toJson(instance.position),
      'work_experience': instance.workExperience,
      'work': instance.work,
      'work_history': const WorkHistoryConverter().toJson(instance.workHistory),
      'region': const RegionEntityConverter().toJson(instance.region),
      'district': const DistrictEntityConverter().toJson(instance.district),
      'address': instance.address,
      'specialization':
          const SpecializationConverter().toJson(instance.specialization),
      'phone_numbers': instance.phoneNumbers
          .map(const PhoneNumberConverter().toJson)
          .toList(),
      'email': instance.email,
      'rating': instance.rating,
      'open_to_work': instance.openToWork,
      'bio': instance.bio,
      'show_in_profile_bio': instance.showInProfileBio,
      'license': const LicenceEntityConverter().toJson(instance.license),
      'instagram': instance.instagram,
      'telegram': instance.telegram,
      'moderation_status': instance.moderationStatus,
      'img': const ImageConverter().toJson(instance.img),
    };

WorkHistoryModel _$WorkHistoryModelFromJson(Map<String, dynamic> json) =>
    WorkHistoryModel(
      position: json['position'] as Map<String, dynamic>? ?? {},
      id: json['id'] as int? ?? 0,
      organization: const OrganizationEntityConverter()
          .fromJson(json['organization'] as Map<String, dynamic>?),
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      isMain: json['is_main'] as bool? ?? false,
    );

Map<String, dynamic> _$WorkHistoryModelToJson(WorkHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization':
          const OrganizationEntityConverter().toJson(instance.organization),
      'position': instance.position,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_main': instance.isMain,
    };

LicenseModel _$LicenseModelFromJson(Map<String, dynamic> json) => LicenseModel(
      size: json['size'] as int? ?? 0,
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$LicenseModelToJson(LicenseModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'size': instance.size,
    };

PositionModel _$PositionModelFromJson(Map<String, dynamic> json) =>
    PositionModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$PositionModelToJson(PositionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
