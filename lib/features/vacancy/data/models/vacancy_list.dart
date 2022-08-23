import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vacancy_list.g.dart';

@JsonSerializable()
class VacancyListModel extends VacancyListEntity {
  const VacancyListModel({
    required super.workType,
    required super.title,
    required super.categoryEntity,
    required super.id,
    required super.organizationEntity,
    required super.address,
    required super.slug,
    required super.salaryFrom,
    required super.description,
    required super.salaryTo,
    required super.requirements,
    required super.employerInfo,
    required super.experienceFrom,
    required super.isFavorite,
    required super.obligations,
    required super.publishedAt,
  });

  factory VacancyListModel.fromJson(Map<String, dynamic> json) => _$VacancyListModelFromJson(json);
}

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.id, required super.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

@JsonSerializable()
class OrganizationModel extends OrganizationEntity {
  const OrganizationModel({
    required super.title,
    required super.id,
    required super.phoneNumber,
    required super.phoneNumbers,
    required super.slug,
    required super.address,
    required super.images,
    required super.locationUrl,
    required super.rating,
    required super.speciazilation,
    required super.types,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationModelFromJson(json);
}

@JsonSerializable()
class PhoneNumberModel extends PhoneNumberEntity {
  const PhoneNumberModel({required super.phoneNumber});

  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) => _$PhoneNumberModelFromJson(json);
}

@JsonSerializable()
class SpecializationModel extends Specialization {
  const SpecializationModel({required super.id, required super.title});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);
}

@JsonSerializable()
class TypesModel extends TypesEntity {
  const TypesModel({required super.title, required super.id});

  factory TypesModel.fromJson(Map<String, dynamic> json) => _$TypesModelFromJson(json);
}

@JsonSerializable()
class WorkTypeModel extends WorkType {
  const WorkTypeModel({required super.title, required super.name});

  factory WorkTypeModel.fromJson(Map<String, dynamic> json) => _$WorkTypeModelFromJson(json);
}
