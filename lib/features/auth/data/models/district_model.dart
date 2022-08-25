import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DistrictModel extends DistrictEntity {
  const DistrictModel({
    required super.soato,
    required super.title,
    required super.id,
    required super.region,
  });
  factory DistrictModel.fromJson(Map<String, dynamic> json) => _$DistrictModelFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}

class DistrictConverter implements JsonConverter<DistrictEntity, Map<String, dynamic>?> {
  const DistrictConverter();
  @override
  DistrictEntity fromJson(Map<String, dynamic>? json) => DistrictModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DistrictEntity object) => {};
}
