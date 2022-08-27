// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitlerModel _$TitlerModelFromJson(Map<String, dynamic> json) => TitlerModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$TitlerModelToJson(TitlerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
