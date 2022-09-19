// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comfort_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComfortModel _$ComfortModelFromJson(Map<String, dynamic> json) => ComfortModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      icon: json['icon'] == null
          ? const IconEntity()
          : const IconConverter()
              .fromJson(json['icon'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ComfortModelToJson(ComfortModel instance) =>
    <String, dynamic>{
      'icon': const IconConverter().toJson(instance.icon),
      'id': instance.id,
      'name': instance.name,
    };
