import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_organization.g.dart';

@JsonSerializable()
class TopOrganizationModel extends TopOrganizationEntity {
  const TopOrganizationModel({
    required super.title,
    required super.vacancyCount,
    required super.logo,
    required super.slug,
    required super.id,
  });

  factory TopOrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$TopOrganizationModelFromJson(json);
}

@JsonSerializable()
class LogoModel extends LogoEntity {
  const LogoModel({
    required super.middle,
    required super.origin,
    required super.small,
  });

  factory LogoModel.fromJson(Map<String, dynamic> json) => _$LogoModelFromJson(json);
}
