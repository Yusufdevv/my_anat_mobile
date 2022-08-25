import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegionModel extends RegionEntity {
  const RegionModel({
    required super.id,
    required super.title,
    required super.soato,
  });
  factory RegionModel.fromJson(Map<String, dynamic> json) => _$RegionModelFromJson(json);
}

class RegionConverter implements JsonConverter<RegionEntity, Map<String, dynamic>?> {
  const RegionConverter();
  @override
  RegionEntity fromJson(Map<String, dynamic>? json) => RegionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(RegionEntity object) => {};
}
