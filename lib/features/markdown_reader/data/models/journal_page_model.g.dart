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
      contentUz: json['content_uz'] as String? ?? '',
      contentRu: json['content_ru'] as String? ?? '',
      imgContent: json['img_content'] as String? ?? '',
    );

Map<String, dynamic> _$JournalPageModelToJson(JournalPageModel instance) =>
    <String, dynamic>{
      'journal': instance.journal,
      'content_ru': instance.contentRu,
      'content_uz': instance.contentUz,
      'img_content': instance.imgContent,
      'page': instance.page,
      'preview': instance.preview,
    };
