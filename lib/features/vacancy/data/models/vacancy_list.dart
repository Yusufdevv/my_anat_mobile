import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vacancy_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VacancyListModel extends VacancyListEntity {
  const VacancyListModel({
    required super.workType,
    required super.title,
    required super.category,
    required super.id,
    required super.organization,
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
    required super.experienceTo,
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
    required super.logo,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) => _$OrganizationModelFromJson(json);
}

@JsonSerializable()
class PhoneNumberModel extends PhoneNumberEntity {
  const PhoneNumberModel({required super.phoneNumber});

  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) => _$PhoneNumberModelFromJson(json);
}


@JsonSerializable()
class TypesModel extends TypesEntity {
  const TypesModel({required super.title, required super.id});

  factory TypesModel.fromJson(Map<String, dynamic> json) => _$TypesModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WorkTypeModel extends WorkType {
  const WorkTypeModel({required super.label, required super.name});

  factory WorkTypeModel.fromJson(Map<String, dynamic> json) => _$WorkTypeModelFromJson(json);
}

@JsonSerializable()
class ImageModel extends ImageEntity {
  const ImageModel({required super.origin, required super.small, required super.middle});

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}
