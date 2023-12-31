// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorSingleModel _$DoctorSingleModelFromJson(Map<String, dynamic> json) =>
    DoctorSingleModel(
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      doctorName: json['doctor_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) =>
                  const ImageConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      organizations: (json['organizations'] as List<dynamic>?)
              ?.map((e) => const OrganizationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      moderationStatus: json['moderation_status'] as String? ?? '',
      position: json['position'] == null
          ? const PositionEntity()
          : const PositionEntityConverter()
              .fromJson(json['position'] as Map<String, dynamic>?),
      fullName: json['full_name'] as String? ?? '',
      workExperience: json['work_experience'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      specializations: (json['specializations'] as List<dynamic>?)
              ?.map((e) => const SpecializationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      region: json['region'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      district: json['district'] == null
          ? const DistrictEntity()
          : const DistrictConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      img: json['img'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['img'] as Map<String, dynamic>?),
      telegram: json['telegram'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      openToWork: json['open_to_work'] as bool? ?? false,
      showInProfileBio: json['show_in_profile_bio'] as bool? ?? false,
      work: json['work'] as String? ?? '',
      licence: json['licence'] == null
          ? const LicenceEntity()
          : const LicenceEntityConverter()
              .fromJson(json['licence'] as Map<String, dynamic>?),
      commentCount: json['comment_count'] as int? ?? 0,
      organization: json['organization'] == null
          ? const OrganizationEntity()
          : const OrganizationConverter()
              .fromJson(json['organization'] as Map<String, dynamic>?),
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => const PhoneNumberConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      diplom: json['diplom'] == null
          ? const DiplomEntity()
          : const DiplomConverter()
              .fromJson(json['diplom'] as Map<String, dynamic>?),
      imgIsFull: json['img_is_full'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      organizationName: json['organization_name'] as String? ?? '',
      paid: json['paid'] as bool? ?? false,
    );

Map<String, dynamic> _$DoctorSingleModelToJson(DoctorSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'doctor_name': instance.doctorName,
      'position': const PositionEntityConverter().toJson(instance.position),
      'work_experience': instance.workExperience,
      'work': instance.work,
      'region': const RegionConverter().toJson(instance.region),
      'district': const DistrictConverter().toJson(instance.district),
      'address': instance.address,
      'specializations': instance.specializations
          .map(const SpecializationConverter().toJson)
          .toList(),
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'rating': instance.rating,
      'open_to_work': instance.openToWork,
      'bio': instance.bio,
      'show_in_profile_bio': instance.showInProfileBio,
      'licence': const LicenceEntityConverter().toJson(instance.licence),
      'instagram': instance.instagram,
      'telegram': instance.telegram,
      'moderation_status': instance.moderationStatus,
      'img': const ImageConverter().toJson(instance.img),
      'images': instance.images.map(const ImageConverter().toJson).toList(),
      'comment_count': instance.commentCount,
      'organization':
          const OrganizationConverter().toJson(instance.organization),
      'organizations': instance.organizations
          .map(const OrganizationConverter().toJson)
          .toList(),
      'phone_numbers': instance.phoneNumbers
          .map(const PhoneNumberConverter().toJson)
          .toList(),
      'img_is_full': instance.imgIsFull,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'diplom': const DiplomConverter().toJson(instance.diplom),
      'paid': instance.paid,
      'organization_name': instance.organizationName,
    };
