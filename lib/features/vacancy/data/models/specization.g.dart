// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecizationModel _$SpecizationModelFromJson(Map<String, dynamic> json) =>
    SpecizationModel(
      vacancyCount: json['vacancy_count'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$SpecizationModelToJson(SpecizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vacancy_count': instance.vacancyCount,
    };
