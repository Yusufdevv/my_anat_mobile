// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacancyOptionModel _$VacancyOptionModelFromJson(Map<String, dynamic> json) =>
    VacancyOptionModel(
      name: json['name'] as String? ?? '',
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => ChoicesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$VacancyOptionModelToJson(VacancyOptionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'choices': instance.choices,
    };
