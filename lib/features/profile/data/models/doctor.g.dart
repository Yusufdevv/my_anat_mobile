// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: json['id'] as int? ?? 0,
      fullName: json['full_name'] as String? ?? '',
      position: json['position'] as String? ?? '',
      workExperience: json['work_experience'] as int? ?? 0,
      work: json['work'] as String? ?? '',
      region: json['region'] == null
          ? null
          : RegionModel.fromJson(json['region'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : DistrictModel.fromJson(json['district'] as Map<String, dynamic>),
      address: json['address'] as String? ?? '',
      specialization: json['specialization'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      email: json['email'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      openToWork: json['open_to_work'] as bool? ?? false,
      bio: json['bio'] as String? ?? '',
      showInProfileBio: json['show_in_profile_bio'] as bool? ?? false,
      license: json['license'] == null
          ? null
          : LicenseModel.fromJson(json['license'] as Map<String, dynamic>),
      instagram: json['instagram'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
      moderationStatus: json['moderation_status'] as String? ?? '',
      img: json['img'] == null
          ? null
          : ImageModel.fromJson(json['img'] as Map<String, dynamic>),
    );
