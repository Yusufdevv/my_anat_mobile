// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    DistrictModel(
      region: const RegionEntityConverter()
          .fromJson(json['region'] as Map<String, dynamic>?),
      soato: json['soato'] as String? ?? '',
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$DistrictModelToJson(DistrictModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'soato': instance.soato,
      'region': const RegionEntityConverter().toJson(instance.region),
    };
