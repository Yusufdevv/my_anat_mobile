import 'package:anatomica/features/home/domain/entities/device_id_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_id_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DeviceIdModel extends DeviceIdEntity {
  const DeviceIdModel({required super.deviceId, required super.id});

  factory DeviceIdModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceIdModelFromJson(json);
}
