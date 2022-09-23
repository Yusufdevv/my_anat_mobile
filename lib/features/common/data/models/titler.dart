import 'package:json_annotation/json_annotation.dart';

part 'titler.g.dart';

@JsonSerializable()
class TitlerModel {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id ;
  @JsonKey(name: 'title',defaultValue: '')
  final String title;
  const TitlerModel({required this.title,required this.id});
  factory TitlerModel.fromJson(Map<String,dynamic> json)=>_$TitlerModelFromJson(json);
}