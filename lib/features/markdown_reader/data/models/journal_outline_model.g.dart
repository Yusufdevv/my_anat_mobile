// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_outline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalOutlineModel _$JournalOutlineModelFromJson(Map<String, dynamic> json) =>
    JournalOutlineModel(
      readTime: json['read_time'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      image: json['image'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      author: json['author'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$JournalOutlineModelToJson(
        JournalOutlineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'title': instance.title,
      'image': instance.image,
      'read_time': instance.readTime,
      'author': instance.author,
    };
