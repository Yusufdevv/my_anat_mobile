// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalDoctorsModel _$HospitalDoctorsModelFromJson(
        Map<String, dynamic> json) =>
    HospitalDoctorsModel(
      fullName: json['full_name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      specialization: json['specialization'] == null
          ? const SpecializationEntity()
          : const SpecializationConverter()
              .fromJson(json['specialization'] as Map<String, dynamic>?),
      isFavourite: json['is_favourite'] as bool? ?? false,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      position: json['position'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
      workExperience: json['work_experience'] as int? ?? 0,
    );

Map<String, dynamic> _$HospitalDoctorsModelToJson(
        HospitalDoctorsModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'id': instance.id,
      'specialization':
          const SpecializationConverter().toJson(instance.specialization),
      'rating': instance.rating,
      'image': const ImageConverter().toJson(instance.image),
      'position': instance.position,
      'phone_number': instance.phoneNumber,
      'work_experience': instance.workExperience,
      'address': instance.address,
      'is_favourite': instance.isFavourite,
    };
