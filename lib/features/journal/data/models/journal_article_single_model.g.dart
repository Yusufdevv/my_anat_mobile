// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_article_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalArticleSingleModel _$JournalArticleSingleModelFromJson(
        Map<String, dynamic> json) =>
    JournalArticleSingleModel(
      shortDescription: json['short_description'] as String? ?? '',
      journal: json['journal'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      organization: json['organization'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      viewCount: json['view_count'] as int? ?? 0,
      isPremium: json['is_premium'] as bool? ?? false,
      category: json['category'] == null
          ? const CategoryEntity()
          : const CategoryEntityConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      publishDate: json['publish_date'] as String? ?? '',
      redaction: json['redaction'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$JournalArticleSingleModelToJson(
        JournalArticleSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image': const ImageConverter().toJson(instance.image),
      'category': const CategoryEntityConverter().toJson(instance.category),
      'redaction': instance.redaction,
      'short_description': instance.shortDescription,
      'description': instance.description,
      'price': instance.price,
      'journal': instance.journal,
      'publish_date': instance.publishDate,
      'organization': instance.organization,
      'view_count': instance.viewCount,
      'is_premium': instance.isPremium,
    };
