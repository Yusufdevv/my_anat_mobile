// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      doctor: json['doctor'] as int? ?? 0,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      journal: json['journal'] as String? ?? '',
      link: json['link'] as String? ?? '',
      organization: json['organization'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      type: json['type'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image': const ImageConverter().toJson(instance.image),
      'type': instance.type,
      'content': instance.content,
      'organization': instance.organization,
      'doctor': instance.doctor,
      'journal': instance.journal,
      'link': instance.link,
    };
