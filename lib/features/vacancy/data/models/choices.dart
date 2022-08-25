import 'package:anatomica/features/vacancy/domain/entities/choices.dart';
import 'package:json_annotation/json_annotation.dart';
part 'choices.g.dart';

@JsonSerializable()
class ChoicesModel extends Choices {
  const ChoicesModel({required super.value, required super.key});

  factory ChoicesModel.fromJson(Map<String, dynamic> json) => _$ChoicesModelFromJson(json);
}
