import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class RegionEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'soato', defaultValue: '')
  final String soato;

  const RegionEntity({
    required this.id,
    required this.title,
    required this.soato,
  });

  factory RegionEntity.empty() =>
      const RegionEntity(id: 0, title: '', soato: '');

  @override
  List<Object?> get props => [id, title, soato];

  RegionEntity copyWith({
    int? id,
    String? title,
    String? soato,
  }) =>
      RegionEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        soato: soato ?? this.soato,
      );
}
