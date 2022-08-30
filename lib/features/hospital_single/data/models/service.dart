
import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class SingleServiceModel {
  @JsonKey(name: 'name',defaultValue: '')
  final String name ;
  @JsonKey(name: 'id',defaultValue: 0)
  final int id ;
  @JsonKey(name: 'url',defaultValue: '')
  final String url;
  SingleServiceModel({required this.id,required this.name,required this.url});
  factory SingleServiceModel.fromJson(Map<String,dynamic> json)=>_$SingleServiceModelFromJson(json );
}