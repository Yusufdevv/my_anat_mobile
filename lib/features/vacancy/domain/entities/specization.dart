import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SpecizationEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'vacancy_count', defaultValue: 0)
  final int vacancyCount;

  const SpecizationEntity({
    required this.vacancyCount,
    required this.title,
    required this.id,
  });

  @override
  List<Object?> get props => [vacancyCount, title, id];
}
