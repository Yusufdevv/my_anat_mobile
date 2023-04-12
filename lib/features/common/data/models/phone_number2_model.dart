
import 'package:json_annotation/json_annotation.dart';

part 'phone_number2_model.g.dart';

@JsonSerializable()
class PhoneNumber2Model {
  @JsonKey(name: 'phone_number',defaultValue: '')
  final String phoneNumber ;
  PhoneNumber2Model({required this.phoneNumber});

  factory PhoneNumber2Model.fromJson(Map<String,dynamic> json)=>_$PhoneNumber2ModelFromJson(json);
}