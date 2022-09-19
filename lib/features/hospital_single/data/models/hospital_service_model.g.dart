// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalServiceModel _$HospitalServiceModelFromJson(
        Map<String, dynamic> json) =>
    HospitalServiceModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$HospitalServiceModelToJson(
        HospitalServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };
