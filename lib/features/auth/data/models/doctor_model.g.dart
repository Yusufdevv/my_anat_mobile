// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      region: json['region'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      img: json['img'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['img'] as Map<String, dynamic>?),
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
      specialization: json['specialization'] == null
          ? const SpecializationEntity()
          : const SpecializationConverter()
              .fromJson(json['specialization'] as Map<String, dynamic>?),
      workExperience: json['work_experience'] as int? ?? 0,
      work: json['work'] as String? ?? '',
      showInProfileBio: json['show_in_profile_bio'] as bool? ?? false,
      openToWork: json['open_to_work'] as bool? ?? false,
      moderationStatus: json['moderation_status'] as String? ?? '',
      license: json['license'] == null
          ? const LicenseEntity()
          : const LicenseConverter()
              .fromJson(json['license'] as Map<String, dynamic>?),
      district: json['district'] == null
          ? const DistrictEntity()
          : const DistrictConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      bio: json['bio'] as String? ?? '',
      position: json['position'] == null
          ? const SpecializationEntity()
          : const SpecializationConverter()
              .fromJson(json['position'] as Map<String, dynamic>?),
      instagram: json['instagram'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
    );
