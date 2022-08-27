// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListModel _$CategoryListModelFromJson(Map<String, dynamic> json) =>
    CategoryListModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      vacancyCount: json['vacancyCount'] as int? ?? 0,
    );

Map<String, dynamic> _$CategoryListModelToJson(CategoryListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vacancyCount': instance.vacancyCount,
    };
