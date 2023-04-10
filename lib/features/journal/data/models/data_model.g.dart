// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
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
      id: json['id'] as int? ?? -1,
      author: (json['author'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
      languageRu: json['language_ru'] as bool? ?? false,
      languageUz: json['language_uz'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      organization: json['organization'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      uzumLink: json['uzum_link'] as String? ?? '',
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'image': const ImageConverter().toJson(instance.image),
      'organization': instance.organization,
      'category': const CategoryEntityConverter().toJson(instance.category),
      'redaction': instance.redaction,
      'is_premium': instance.isPremium,
      'price': instance.price,
      'author': instance.author,
      'is_active': instance.isActive,
      'publish_date': instance.publishDate,
      'tags': instance.tags,
      'language_uz': instance.languageUz,
      'language_ru': instance.languageRu,
      'uzum_link': instance.uzumLink,
    };
