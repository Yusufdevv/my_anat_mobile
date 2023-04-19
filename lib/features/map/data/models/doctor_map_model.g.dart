// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorMapModel _$DoctorMapModelFromJson(Map<String, dynamic> json) =>
    DoctorMapModel(
      address: json['address'] as String? ?? '',
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
      fullName: json['full_name'] as String? ?? '',
      doctorName: json['doctor_name'] as String? ?? '',
      specializations: (json['specializations'] as List<dynamic>?)
              ?.map((e) => TitlerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as int? ?? -1,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      imgIsFull: json['img_is_full'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      organizationName: json['organization_name'] as String? ?? '',
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map(
                  (e) => (e as List<dynamic>).map((e) => e as String).toList())
              .toList() ??
          const <List<String>>[],
      position: json['position'] as String? ?? '',
      rating: json['rating'] as num? ?? 0,
    );
