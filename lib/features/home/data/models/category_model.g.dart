// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      icon: json['icon'] == null
          ? const IconEntity()
          : const IconConverter()
              .fromJson(json['icon'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': const IconConverter().toJson(instance.icon),
    };
