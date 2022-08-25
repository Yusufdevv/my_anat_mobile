import 'package:anatomica/features/vacancy/data/models/choices.dart';
import 'package:anatomica/features/vacancy/domain/entities/choices.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class VacancyOptionEntity extends Equatable {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'label', defaultValue: '')
  final String label;
  @JsonKey(name: 'choices', defaultValue: [])
  final List<ChoicesModel> choices;

  const VacancyOptionEntity({
    required this.name,
    required this.choices,
    required this.label,
  });

  @override
  List<Object?> get props => [name, choices, label];
}
