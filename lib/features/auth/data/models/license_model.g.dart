// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LicenseModel _$LicenseModelFromJson(Map<String, dynamic> json) => LicenseModel(
      size: json['size'] as int? ?? 0,
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$LicenseModelToJson(LicenseModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'size': instance.size,
    };
