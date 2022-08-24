import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PhoneNumberEntity extends Equatable {
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;

  const PhoneNumberEntity({required this.phoneNumber});

  factory PhoneNumberEntity.empty() => const PhoneNumberEntity(phoneNumber: '');

  @override
  List<Object?> get props => [phoneNumber];

  PhoneNumberEntity copyWith({
    String? phoneNumber,
  }) =>
      PhoneNumberEntity(phoneNumber: phoneNumber ?? this.phoneNumber);
}
