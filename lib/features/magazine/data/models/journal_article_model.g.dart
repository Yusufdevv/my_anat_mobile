// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalArticleModel _$JournalArticleModelFromJson(Map<String, dynamic> json) =>
    JournalArticleModel(
      viewCount: json['view_count'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      isPremium: json['is_premium'] as bool? ?? false,
      category: json['category'] == null
          ? const CategoryEntity()
          : const CategoryEntityConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      slug: json['slug'] as String? ?? '',
      publishDate: json['publish_date'] as String? ?? '',
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      redaction: json['redaction'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      isBought: json['is_bought'] as bool? ?? false,
    );

Map<String, dynamic> _$JournalArticleModelToJson(
        JournalArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image': const ImageConverter().toJson(instance.image),
      'publish_date': instance.publishDate,
      'category': const CategoryEntityConverter().toJson(instance.category),
      'is_premium': instance.isPremium,
      'redaction': instance.redaction,
      'view_count': instance.viewCount,
      'is_bought': instance.isBought,
    };
