// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchased_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasedArticle _$PurchasedArticleFromJson(Map<String, dynamic> json) =>
    PurchasedArticle(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      slug: json['slug'] as String? ?? '',
      publishDate: json['publish_date'] as String? ?? '',
      category: json['category'] == null
          ? const TitlerModel(title: '', id: -1)
          : TitlerModel.fromJson(json['category'] as Map<String, dynamic>),
      isPremium: json['is_premium'] as bool? ?? false,
      moderizationStatus: json['moderation_status'] as String? ?? '',
      paidForPublish: json['is_paid_for_publish'] as bool? ?? false,
      redaction: json['redaction'] as String? ?? '',
      viewCount: json['view_count'] as int? ?? 0,
    );

Map<String, dynamic> _$PurchasedArticleToJson(PurchasedArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_paid_for_publish': instance.paidForPublish,
      'moderation_status': instance.moderizationStatus,
      'slug': instance.slug,
      'images': instance.images,
      'publish_date': instance.publishDate,
      'category': instance.category,
      'is_premium': instance.isPremium,
      'redaction': instance.redaction,
      'view_count': instance.viewCount,
    };
