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
      specialization: json['specialization'] as String? ?? '',
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
      position: json['position'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'position': instance.position,
      'work_experience': instance.workExperience,
      'work': instance.work,
      'region': const RegionConverter().toJson(instance.region),
      'district': const DistrictConverter().toJson(instance.district),
      'address': instance.address,
      'specialization': instance.specialization,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'rating': instance.rating,
      'open_to_work': instance.openToWork,
      'bio': instance.bio,
      'show_in_profile_bio': instance.showInProfileBio,
      'license': const LicenseConverter().toJson(instance.license),
      'instagram': instance.instagram,
      'telegram': instance.telegram,
      'moderation_status': instance.moderationStatus,
      'img': const ImageConverter().toJson(instance.img),
    };
