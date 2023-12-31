// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchased_journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasedJournalModel _$PurchasedJournalModelFromJson(
        Map<String, dynamic> json) =>
    PurchasedJournalModel(
      redaction: json['redaction'] as String? ?? '',
      isPremium: json['is_premium'] as bool? ?? false,
      category: json['category'] == null
          ? const CategoryModel(title: '', id: 0)
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      publishDate: json['publish_date'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      image: json['image'] == null
          ? const ImageModel(origin: '', small: '', middle: '', id: 0)
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      fileExtension: json['file_extension'] as String? ?? '',
      isBought: json['is_bought'] as bool? ?? false,
      organization: json['organization'] as int? ?? 0,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TitlerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PurchasedJournalModelToJson(
        PurchasedJournalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'image': instance.image,
      'category': instance.category,
      'organization': instance.organization,
      'redaction': instance.redaction,
      'is_premium': instance.isPremium,
      'price': instance.price,
      'publish_date': instance.publishDate,
      'file_extension': instance.fileExtension,
      'tags': instance.tags,
      'is_bought': instance.isBought,
    };
