import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class TypeEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  const TypeEntity({this.title = '', this.id = 0});

  @override
  List<Object?> get props => [id, title];
}
