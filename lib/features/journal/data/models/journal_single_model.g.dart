// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalSingleModel _$JournalSingleModelFromJson(Map<String, dynamic> json) =>
    JournalSingleModel(
      preview: json['preview'] == null
          ? const PreviewEntity()
          : const PreviewEntityConverter()
              .fromJson(json['preview'] as Map<String, dynamic>?),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) =>
                  const TagConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      publishDate: json['publish_date'] as String? ?? '',
      redaction: json['redaction'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      organizationId: json['organization_id'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      category: json['category'] == null
          ? const CategoryEntity()
          : const CategoryEntityConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      isPremium: json['is_premium'] as bool? ?? false,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$JournalSingleModelToJson(JournalSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'image': const ImageConverter().toJson(instance.image),
      'organization_id': instance.organizationId,
      'category': const CategoryEntityConverter().toJson(instance.category),
      'redaction': instance.redaction,
      'preview': const PreviewEntityConverter().toJson(instance.preview),
      'is_premium': instance.isPremium,
      'price': instance.price,
      'is_active': instance.isActive,
      'publish_date': instance.publishDate,
      'tags': instance.tags.map(const TagConverter().toJson).toList(),
    };
