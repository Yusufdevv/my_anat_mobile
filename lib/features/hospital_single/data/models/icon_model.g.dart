// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IconModel _$IconModelFromJson(Map<String, dynamic> json) => IconModel(
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      file: json['file'] == null
          ? const FileEntity()
          : const FileConverter()
              .fromJson(json['file'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$IconModelToJson(IconModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'file': const FileConverter().toJson(instance.file),
    };
