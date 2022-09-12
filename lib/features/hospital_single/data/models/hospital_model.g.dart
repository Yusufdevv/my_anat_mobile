// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      slug: json['slug'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
      email: json['email'] as String? ?? '',
      website: json['website'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      facebook: json['facebook'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      id: json['id'] as int? ?? 0,
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
      'website': instance.website,
      'email': instance.email,
      'instagram': instance.instagram,
      'facebook': instance.facebook,
      'telegram': instance.telegram,
      'description': instance.description,
      'images': instance.images,
      'logo': instance.logo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'rating': instance.rating,
    };
