// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) =>
    OrganizationModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      specialization: (json['specialization'] as List<dynamic>?)
              ?.map((e) => const SpecializationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      address: json['address'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      types: (json['types'] as List<dynamic>?)
              ?.map((e) =>
                  const TypeConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => const PhoneNumberConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      logo: json['logo'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['logo'] as Map<String, dynamic>?),
      locationUrl: json['location_url'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) =>
                  const ImageConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      slug: json['slug'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$OrganizationModelToJson(OrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'logo': const ImageConverter().toJson(instance.logo),
      'images': instance.images.map(const ImageConverter().toJson).toList(),
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'phone_numbers': instance.phoneNumbers
          .map(const PhoneNumberConverter().toJson)
          .toList(),
      'rating': instance.rating,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'specialization': instance.specialization
          .map(const SpecializationConverter().toJson)
          .toList(),
      'types': instance.types.map(const TypeConverter().toJson).toList(),
      'location_url': instance.locationUrl,
    };
