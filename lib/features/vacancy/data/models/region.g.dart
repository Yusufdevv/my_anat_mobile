// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      soato: json['soato'] as String? ?? '',
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'soato': instance.soato,
    };
