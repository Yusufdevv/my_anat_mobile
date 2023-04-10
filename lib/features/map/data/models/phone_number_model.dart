import 'package:anatomica/features/map/domain/entities/phone_number_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'phone_number_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PhoneNumberModel extends PhoneNumberEntity {
  const PhoneNumberModel({required super.phoneNumber});
  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneNumberModelToJson(this);
}
