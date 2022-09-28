// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionModel _$SuggestionModelFromJson(Map<String, dynamic> json) =>
    SuggestionModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$SuggestionModelToJson(SuggestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
