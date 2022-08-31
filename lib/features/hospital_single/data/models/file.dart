
import 'package:json_annotation/json_annotation.dart';
part 'file.g.dart';

@JsonSerializable()
class FileModel {
  @JsonKey(name: 'url',defaultValue: '')
  final String url ;
  @JsonKey(name: 'size',defaultValue:0)
  final int size ;
  FileModel({required this.url,required this.size});


  factory FileModel.fromJson(Map<String,dynamic> json)=>_$FileModelFromJson(json);
  Map<String,dynamic> toJson()=>_$FileModelToJson(this);
}