// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceIdModel _$DeviceIdModelFromJson(Map<String, dynamic> json) =>
    DeviceIdModel(
      deviceId: json['device_id'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$DeviceIdModelToJson(DeviceIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'device_id': instance.deviceId,
    };
