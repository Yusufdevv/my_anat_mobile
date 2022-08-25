import 'package:anatomica/features/vacancy/domain/entities/specization.dart';
import 'package:json_annotation/json_annotation.dart';
part 'specization.g.dart';

@JsonSerializable()
class SpecizationModel extends SpecizationEntity {
  const SpecizationModel({required super.vacancyCount, required super.title, required super.id});

  factory SpecizationModel.fromJson(Map<String, dynamic> json) => _$SpecizationModelFromJson(json);
}
