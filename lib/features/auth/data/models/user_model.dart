import 'package:anatomica/features/auth/data/models/doctor_model.dart';
import 'package:anatomica/features/auth/data/models/user_organization_model.dart';
import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel extends UserEntity {
  const UserModel({
    required super.organizations,
    required super.isSubscribed,
    required super.isOrganization,
    required super.isDoctor,
    required super.doctor,
    required super.username,
    required super.email,
    required super.fullName,
    required super.img,
    required super.id,
    required super.phoneNumber,
    required super.birthDay,
    required super.autoRenewDoctor,
    required super.autoRenewJournal,
    required super.autoRenewOrganization,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

class UserConverter implements JsonConverter<UserEntity, Map<String, dynamic>?> {
  const UserConverter();
  @override
  UserEntity fromJson(Map<String, dynamic>? json) => UserModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(UserEntity object) => {};
}
