// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoModel _$LogoModelFromJson(Map<String, dynamic> json) => LogoModel(
      small: json['small'] as String? ?? '',
      middle: json['middle'] as String? ?? '',
      origin: json['origin'] as String? ?? '',
    );

Map<String, dynamic> _$LogoModelToJson(LogoModel instance) => <String, dynamic>{
      'origin': instance.origin,
      'middle': instance.middle,
      'small': instance.small,
    };
