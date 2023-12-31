// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorInterviewModel _$DoctorInterviewModelFromJson(
        Map<String, dynamic> json) =>
    DoctorInterviewModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      description: json['description'] as String? ?? '',
      viewCount: json['view_count'] as int? ?? 0,
      content: json['content'] as String? ?? '',
      doctors:
          (json['doctors'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      isActive: json['is_active'] as bool? ?? false,
      videoDuration: json['video_duration'] as int? ?? 0,
    );

Map<String, dynamic> _$DoctorInterviewModelToJson(
        DoctorInterviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'image': const ImageConverter().toJson(instance.image),
      'title': instance.title,
      'slug': instance.slug,
      'video_duration': instance.videoDuration,
      'content': instance.content,
      'description': instance.description,
      'view_count': instance.viewCount,
      'is_active': instance.isActive,
      'doctors': instance.doctors,
    };
