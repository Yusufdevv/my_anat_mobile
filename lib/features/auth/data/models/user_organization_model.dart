import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/organization_entity.dart';
import 'package:anatomica/features/auth/domain/entities/user_organization_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_organization_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserOrganizationModel extends UserOrganizationEntity {
  const UserOrganizationModel({
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
    required super.name,
  });

  factory UserOrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$UserOrganizationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrganizationModelToJson(this);
}

class UserOrganizationConverter
    implements JsonConverter<UserOrganizationEntity, Map<String, dynamic>?> {
  const UserOrganizationConverter();

  @override
  UserOrganizationEntity fromJson(Map<String, dynamic>? json) =>
      UserOrganizationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(UserOrganizationEntity object) => {};
}
