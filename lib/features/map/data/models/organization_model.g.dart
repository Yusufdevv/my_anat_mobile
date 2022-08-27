// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) =>
    OrganizationModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      logo: LogoModel.fromJson(json['logo'] as Map<String, dynamic>),
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
      rating: json['rating'] as int? ?? 0,
      specialization: (json['specialization'] as List<dynamic>?)
              ?.map((e) => TitlerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OrganizationModelToJson(OrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'rating': instance.rating,
      'location_url': instance.locationUrl,
      'logo': instance.logo,
      'phone_numbers': instance.phoneNumbers,
      'specialization': instance.specialization,
      'types': instance.types,
    };
