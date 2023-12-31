// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as int? ?? 0,
      userFullName: json['user_full_name'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      isOwn: json['is_own'] as bool? ?? false,
      userImage: json['user_image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['user_image'] as Map<String, dynamic>?),
      fullName: json['full_name'] as String? ?? '',
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
      'created_at': instance.createdAt,
      'user_full_name': instance.userFullName,
      'full_name': instance.fullName,
      'user_image': const ImageConverter().toJson(instance.userImage),
      'is_own': instance.isOwn,
    };
