import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/map/data/models/phone_number_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class PhoneNumberEntity extends Equatable {
  final String phoneNumber;
  const PhoneNumberEntity({this.phoneNumber = ''});
  @override
  List<Object?> get props => [phoneNumber];
  PhoneNumberEntity copyWith({String? phoneNumber}) =>
      PhoneNumberEntity(phoneNumber: phoneNumber ?? this.phoneNumber);
}

class PhoneNumberConverter
    implements JsonConverter<PhoneNumberEntity, Map<String, dynamic>?> {
  const PhoneNumberConverter();
  @override
  PhoneNumberEntity fromJson(Map<String, dynamic>? json) =>
      PhoneNumberModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(PhoneNumberEntity object) => {};
}
