
import 'package:json_annotation/json_annotation.dart';

part 'logo.g.dart';

@JsonSerializable()
class AssetModel {
  @JsonKey(name: 'origin',defaultValue: '')
  final String origin;
  @JsonKey(name: 'middle',defaultValue: '')
  final String middle;
  @JsonKey(name: 'small',defaultValue: '')
  final String small;

  AssetModel({required this.small, required this.middle, required this.origin});
  factory AssetModel.fromJson(Map<String,dynamic> json)=>_$AssetModelFromJson(json);
}
