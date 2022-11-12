// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalPageModel _$JournalPageModelFromJson(Map<String, dynamic> json) =>
    JournalPageModel(
      journal: json['journal'] as int? ?? 0,
      preview: json['preview'] as bool? ?? false,
      page: json['page'] as int? ?? 0,
      content: json['content'] as String? ?? '',
      imgContent: json['img_content'] as String? ?? '',
    );

Map<String, dynamic> _$JournalPageModelToJson(JournalPageModel instance) =>
    <String, dynamic>{
      'journal': instance.journal,
      'content': instance.content,
      'img_content': instance.imgContent,
      'page': instance.page,
      'preview': instance.preview,
    };
