
import 'package:json_annotation/json_annotation.dart';

part 'phone_number.g.dart';

@JsonSerializable()
class PhoneNumberModel {
  @JsonKey(name: 'phone',defaultValue: '')
  final String phone ;
  PhoneNumberModel({required this.phone});

  factory PhoneNumberModel.fromJson(Map<String,dynamic> json)=>_$PhoneNumberModelFromJson(json);
}