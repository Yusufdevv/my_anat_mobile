import 'package:anatomica/features/auth/domain/entities/phone_number_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_number_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PhoneNumberModel extends PhoneNumberEntity {
  const PhoneNumberModel({required super.phoneNumber});
  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) => _$PhoneNumberModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneNumberModelToJson(this);
}

class PhoneNumberConverter implements JsonConverter<PhoneNumberEntity, Map<String, dynamic>?> {
  const PhoneNumberConverter();
  @override
  PhoneNumberEntity fromJson(Map<String, dynamic>? json) => PhoneNumberModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(PhoneNumberEntity object) => {};
}
