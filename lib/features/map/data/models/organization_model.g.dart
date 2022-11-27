// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      id: json['id'] as int? ?? 0,
      imagesList: (json['images'] as List<dynamic>?)
              ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      title: json['title'] as String? ?? '',
      logo: json['logo'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['logo'] as Map<String, dynamic>?),
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => TitlerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      slug: json['slug'] as String? ?? '',
      address: json['address'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      locationUrl: json['location_url'] as String? ?? '',
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => PhoneNumberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      specialization: (json['specialization'] as List<dynamic>?)
              ?.map((e) => TitlerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HospitalModelToJson(HospitalModel instance) =>
    <String, dynamic>{
      'logo': const ImageConverter().toJson(instance.logo),
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'rating': instance.rating,
      'location_url': instance.locationUrl,
      'phone_numbers': instance.phoneNumbers,
      'images': instance.imagesList,
      'specialization': instance.specialization,
      'types': instance.types,
    };
