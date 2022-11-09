// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_service_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalSingleServiceModel _$HospitalSingleServiceModelFromJson(
        Map<String, dynamic> json) =>
    HospitalSingleServiceModel(
      url: json['url'] as String? ?? '',
      image: json['image'] as String? ?? '',
      content: json['content'] as String? ?? '',
      name: json['name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$HospitalSingleServiceModelToJson(
        HospitalSingleServiceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'content': instance.content,
      'image': instance.image,
      'url': instance.url,
    };
