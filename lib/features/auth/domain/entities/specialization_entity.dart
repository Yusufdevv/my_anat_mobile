import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SpecializationEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  const SpecializationEntity({this.id = 0, this.title = ''});

  @override
  List<Object?> get props => [id, title];
}
