import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CategoryListEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: 0)
  final int vacancyCount;

  const CategoryListEntity({
    required this.title,
    required this.id,
    required this.vacancyCount,
  });

  @override
  List<Object?> get props => [id, title, vacancyCount];
}
