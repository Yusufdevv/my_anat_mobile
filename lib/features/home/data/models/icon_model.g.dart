// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconModel _$IconModelFromJson(Map<String, dynamic> json) => IconModel(
      file: json['file'] == null
          ? const FileEntity()
          : const FileConverter()
              .fromJson(json['file'] as Map<String, dynamic>?),
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$IconModelToJson(IconModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file': const FileConverter().toJson(instance.file),
    };
