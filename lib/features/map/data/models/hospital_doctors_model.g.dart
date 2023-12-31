// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalDoctorsModel _$HospitalDoctorsModelFromJson(
        Map<String, dynamic> json) =>
    HospitalDoctorsModel(
      fullName: json['full_name'] as String? ?? '',
      doctorName: json['doctor_name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      specializations: (json['specializations'] as List<dynamic>?)
              ?.map((e) => TitlerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isFavourite: json['is_favourite'] as bool? ?? false,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      position: json['position'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
      workExperience: json['work_experience'] as int? ?? 0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
      imgIsFull: json['img_is_full'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map(
                  (e) => PhoneNumber2Model.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      organizationName: json['organization_name'] as String? ?? '',
    );

Map<String, dynamic> _$HospitalDoctorsModelToJson(
        HospitalDoctorsModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'doctor_name': instance.doctorName,
      'id': instance.id,
      'specializations': instance.specializations,
      'rating': instance.rating,
      'image': const ImageConverter().toJson(instance.image),
      'position': instance.position,
      'phone_number': instance.phoneNumber,
      'work_experience': instance.workExperience,
      'address': instance.address,
      'is_favourite': instance.isFavourite,
      'img_is_full': instance.imgIsFull,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'organization_name': instance.organizationName,
      'phone_numbers': instance.phoneNumbers,
      'distance': instance.distance,
    };
