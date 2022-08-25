import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class PhoneNumberEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final String phoneNumber;
  const PhoneNumberEntity({this.phoneNumber = ''});
  @override
  List<Object?> get props => [];
}
