// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      slug: json['slug'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      id: json['id'] as int? ?? 0,
      banner: (json['images'] as List<dynamic>?)
              ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      address: json['address'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      description: json['description'] as String? ?? '',
      title: json['title'] as String? ?? '',
      logo: AssetModel.fromJson(json['logo'] as Map<String, dynamic>),
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$HospitalModelToJson(HospitalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'address': instance.address,
      'phone': instance.phone,
      'description': instance.description,
      'logo': instance.logo,
      'images': instance.banner,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
    };
