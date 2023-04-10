import 'package:equatable/equatable.dart';

class DeviceIdEntity extends Equatable {
  final int id;
  final String deviceId;

  const DeviceIdEntity({this.id = 0, this.deviceId = ''});

  @override
  List<Object?> get props => [id, deviceId];
}
