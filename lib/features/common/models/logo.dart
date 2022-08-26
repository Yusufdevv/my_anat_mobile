
import 'package:json_annotation/json_annotation.dart';

part 'logo.g.dart';

@JsonSerializable()
class LogoModel {
  @JsonKey(name: 'origin',defaultValue: '')
  final String origin;
  @JsonKey(name: 'middle',defaultValue: '')
  final String middle;
  @JsonKey(name: 'small',defaultValue: '')
  final String small;

  LogoModel({required this.small, required this.middle, required this.origin});
  factory LogoModel.fromJson(Map<String,dynamic> json)=>_$LogoModelFromJson(json);
}
