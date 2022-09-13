// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedImageModel _$UploadedImageModelFromJson(Map<String, dynamic> json) =>
    UploadedImageModel(
      id: json['id'] as int? ?? 0,
      img: json['img'] as String? ?? '',
    );

Map<String, dynamic> _$UploadedImageModelToJson(UploadedImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
    };
