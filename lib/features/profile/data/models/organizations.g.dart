// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationsModel _$OrganizationsModelFromJson(Map<String, dynamic> json) =>
    OrganizationsModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      logo: json['logo'] == null
          ? null
          : ImageModel.fromJson(json['logo'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      address: json['address'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => PhoneNumberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rating: json['rating'] as int? ?? 0,
      specialization: (json['specialization'] as List<dynamic>?)
              ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      locationUrl: json['location_url'] as String? ?? '',
    );
