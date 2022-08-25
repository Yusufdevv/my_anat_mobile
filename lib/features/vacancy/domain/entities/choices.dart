import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Choices extends Equatable {
  @JsonKey(name: 'key', defaultValue: '')
  final String key;
  @JsonKey(name: 'value', defaultValue: '')
  final String value;

  const Choices({
    required this.value,
    required this.key,
  });

  @override
  List<Object?> get props => [value, key];
}
