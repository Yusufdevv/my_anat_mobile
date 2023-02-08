// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_spec_suggest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceSpecSuggestModel _$ServiceSpecSuggestModelFromJson(
        Map<String, dynamic> json) =>
    ServiceSpecSuggestModel(
      name: json['name'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$ServiceSpecSuggestModelToJson(
        ServiceSpecSuggestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };
