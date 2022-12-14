// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_spec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorSpecModel _$DoctorSpecModelFromJson(Map<String, dynamic> json) =>
    DoctorSpecModel(
      fullName: json['full_name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      specialization: json['specialization'] as String? ?? '',
      isFavourite: json['is_favourite'] as bool? ?? false,
      position: json['position'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
      workExperience: json['work_experience'] as int? ?? 0,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$DoctorSpecModelToJson(DoctorSpecModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'id': instance.id,
      'specialization': instance.specialization,
      'rating': instance.rating,
      'image': const ImageConverter().toJson(instance.image),
      'position': instance.position,
      'phone_number': instance.phoneNumber,
      'work_experience': instance.workExperience,
      'address': instance.address,
      'is_favourite': instance.isFavourite,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
