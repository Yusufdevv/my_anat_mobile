import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:json_annotation/json_annotation.dart';

import 'choices.dart';

part 'vacancy_option.g.dart';

@JsonSerializable()
class VacancyOptionModel extends VacancyOptionEntity {
  const VacancyOptionModel({required super.name, required super.choices, required super.label});

    factory VacancyOptionModel.fromJson(Map<String, dynamic> json)=> _$VacancyOptionModelFromJson
    (json);
}
