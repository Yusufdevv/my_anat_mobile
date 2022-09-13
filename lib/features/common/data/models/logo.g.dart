// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => AssetModel(
      small: json['small'] as String? ?? '',
      middle: json['middle'] as String? ?? '',
      origin: json['origin'] as String? ?? '',
    );

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'middle': instance.middle,
      'small': instance.small,
    };
