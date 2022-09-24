
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion.g.dart';

@JsonSerializable()
class SuggestionModel {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id;
  @JsonKey(name: 'title',defaultValue: '')
  final String title;
  SuggestionModel({required this.id,required this.title});

  factory SuggestionModel.fromJson(Map<String,dynamic> json)=>_$SuggestionModelFromJson(json);
}