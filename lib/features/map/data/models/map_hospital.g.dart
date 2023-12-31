// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapHospitalModel _$MapHospitalModelFromJson(Map<String, dynamic> json) =>
    MapHospitalModel(
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      id: json['id'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      workFrom: json['work_from'] as String? ?? '',
      logo: json['logo'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['logo'] as Map<String, dynamic>?),
      workTo: json['work_to'] as String? ?? '',
    );

Map<String, dynamic> _$MapHospitalModelToJson(MapHospitalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'logo': const ImageConverter().toJson(instance.logo),
      'title': instance.title,
      'images': instance.images,
      'work_from': instance.workFrom,
      'work_to': instance.workTo,
      'address': instance.address,
      'rating': instance.rating,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distance': instance.distance,
      'phone_number': instance.phoneNumber,
    };
