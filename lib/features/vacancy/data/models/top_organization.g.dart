// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopOrganizationModel _$TopOrganizationModelFromJson(
        Map<String, dynamic> json) =>
    TopOrganizationModel(
      title: json['title'] as String? ?? '',
      vacancyCount: json['vacancy_count'] as int? ?? 0,
      logo: const LogoEntityConverter()
          .fromJson(json['logo'] as Map<String, dynamic>?),
      slug: json['slug'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$TopOrganizationModelToJson(
        TopOrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'logo': const LogoEntityConverter().toJson(instance.logo),
      'vacancy_count': instance.vacancyCount,
    };

LogoModel _$LogoModelFromJson(Map<String, dynamic> json) => LogoModel(
      middle: json['middle'] as String? ?? '',
      origin: json['origin'] as String? ?? '',
      small: json['small'] as String? ?? '',
    );

Map<String, dynamic> _$LogoModelToJson(LogoModel instance) => <String, dynamic>{
      'origin': instance.origin,
      'middle': instance.middle,
      'small': instance.small,
    };
