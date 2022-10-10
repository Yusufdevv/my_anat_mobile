import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/organization_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrganizationModel extends OrganizationEntity {
  const OrganizationModel({
    required super.id,
    required super.title,
    required super.phoneNumber,
    required super.specialization,
    required super.address,
    required super.rating,
    required super.types,
    required super.phoneNumbers,
    required super.logo,
    required super.locationUrl,
    required super.images,
    required super.slug,
    required super.latitude,
    required super.longitude,
  });
  factory OrganizationModel.fromJson(Map<String, dynamic> json) => _$OrganizationModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationModelToJson(this);
}

class OrganizationConverter implements JsonConverter<OrganizationEntity, Map<String, dynamic>?> {
  const OrganizationConverter();
  @override
  OrganizationEntity fromJson(Map<String, dynamic>? json) => OrganizationModel.fromJson(json ?? {});
  @override
  Map<String, dynamic> toJson(OrganizationEntity object) => {};
}
