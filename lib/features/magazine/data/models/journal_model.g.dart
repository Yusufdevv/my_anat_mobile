// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalModel _$JournalModelFromJson(Map<String, dynamic> json) => JournalModel(
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) =>
                  const TagConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      publishDate: json['publish_date'] as String? ?? '',
      isPremium: json['is_premium'] as bool? ?? false,
      category: json['category'] == null
          ? const CategoryEntity()
          : const CategoryEntityConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      price: json['price'] as int? ?? 0,
      organization: json['organization'] as int? ?? 0,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      description: json['description'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      redaction: json['redaction'] as String? ?? '',
      isBought: json['is_bought'] as bool? ?? false,
      fileExtension: json['file_extension'] as String? ?? '',
    );

Map<String, dynamic> _$JournalModelToJson(JournalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'image': const ImageConverter().toJson(instance.image),
      'category': const CategoryEntityConverter().toJson(instance.category),
      'organization': instance.organization,
      'redaction': instance.redaction,
      'is_premium': instance.isPremium,
      'price': instance.price,
      'publish_date': instance.publishDate,
      'file_extension': instance.fileExtension,
      'is_bought': instance.isBought,
      'tags': instance.tags.map(const TagConverter().toJson).toList(),
    };
