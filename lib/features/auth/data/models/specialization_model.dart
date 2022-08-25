import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specialization_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SpecializationModel extends SpecializationEntity {
  const SpecializationModel({required super.id, required super.title});
  factory SpecializationModel.fromJson(Map<String, dynamic> json) => _$SpecializationModelFromJson(json);
}

class SpecializationConverter implements JsonConverter<SpecializationEntity, Map<String, dynamic>?> {
  const SpecializationConverter();
  @override
  SpecializationEntity fromJson(Map<String, dynamic>? json) => SpecializationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(SpecializationEntity object) => {};
}
