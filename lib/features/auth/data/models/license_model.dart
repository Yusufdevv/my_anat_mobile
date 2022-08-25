import 'package:anatomica/features/auth/domain/entities/license_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LicenseModel extends LicenseEntity {
  const LicenseModel({required super.size, required super.url});
  factory LicenseModel.fromJson(Map<String, dynamic> json) => _$LicenseModelFromJson(json);
}

class LicenseConverter implements JsonConverter<LicenseEntity, Map<String, dynamic>?> {
  const LicenseConverter();
  @override
  LicenseEntity fromJson(Map<String, dynamic>? json) => LicenseModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(LicenseEntity object) => {};
}
