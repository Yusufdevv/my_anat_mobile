import 'package:anatomica/features/profile/domain/entities/phone_number_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_numbers.g.dart';

@JsonSerializable()
class PhoneNumberModel extends PhoneNumberEntity {
  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberModelFromJson(json);

  const PhoneNumberModel({
    required String phoneNumber,
  }) : super(phoneNumber: phoneNumber);

  factory PhoneNumberModel.empty() {
    return const PhoneNumberModel(phoneNumber: '');
  }

  @override
  String toString() {
    return 'PhoneNumberModel(phoneNumber: $phoneNumber)';
  }
}
