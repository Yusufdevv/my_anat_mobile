// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorCommentModel _$DoctorCommentModelFromJson(Map<String, dynamic> json) =>
    DoctorCommentModel(
      comment: json['comment'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      doctor: json['doctor'] as int? ?? 0,
    );

Map<String, dynamic> _$DoctorCommentModelToJson(DoctorCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'rating': instance.rating,
      'comment': instance.comment,
    };
