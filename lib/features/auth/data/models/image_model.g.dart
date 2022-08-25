// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      origin: json['origin'] as String? ?? '',
      small: json['small'] as String? ?? '',
      middle: json['middle'] as String? ?? '',
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'middle': instance.middle,
      'small': instance.small,
    };
