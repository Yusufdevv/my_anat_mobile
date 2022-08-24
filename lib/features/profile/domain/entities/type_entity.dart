import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TypeEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  const TypeEntity({required this.id, required this.title});

  factory TypeEntity.empty() => const TypeEntity(id: 0, title: '');

  @override
  List<Object?> get props => [id, title];

  TypeEntity copyWith({
    int? id,
    String? title,
  }) =>
      TypeEntity(id: id ?? this.id, title: title ?? this.title);
}
