// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      publishDate: json['publish_date'] as String? ?? '',
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      viewCount: json['view_count'] as int? ?? 0,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'image': const ImageConverter().toJson(instance.image),
      'publish_date': instance.publishDate,
      'description': instance.description,
      'view_count': instance.viewCount,
    };
