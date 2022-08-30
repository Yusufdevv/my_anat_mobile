// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      fullName: json['user_full_name'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      isOwn: json['is_own'] as bool? ?? false,
      userImage:
          AssetModel.fromJson(json['user_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'rating': instance.rating,
      'status': instance.status,
      'created_at': instance.createdAt,
      'user_full_name': instance.fullName,
      'user_image': instance.userImage,
      'is_own': instance.isOwn,
    };
