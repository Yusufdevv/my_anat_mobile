import 'package:anatomica/features/hospital_single/data/models/file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'icon.g.dart';

@JsonSerializable()
class IconModel {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id ;
  @JsonKey(name: 'title',defaultValue: '')
  final String title ;
  @JsonKey(name: 'slug',defaultValue: '')
  final String slug ;
  @JsonKey(name: 'file',)
  final FileModel file;
  IconModel({required this.title,required this.slug,required this.id,required this.file});

  factory IconModel.fromJson(Map<String,dynamic> json)=>_$IconModelFromJson(json);
  Map<String,dynamic> toJson()=>_$IconModelToJson(this);
}