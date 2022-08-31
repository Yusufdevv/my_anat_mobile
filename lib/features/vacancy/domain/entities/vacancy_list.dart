import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class VacancyListEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @OrganizationEntityConverter()
  final OrganizationEntity organization;
  @JsonKey(name: 'salary_from', defaultValue: 0)
  final int salaryFrom;
  @JsonKey(name: 'salary_to', defaultValue: 0)
  final int salaryTo;
  @JsonKey(name: 'experience_from', defaultValue: 0)
  final int experienceFrom;
  @JsonKey(name: 'experience_to', defaultValue: 0)
  final int experienceTo;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'address', defaultValue: '')
  final String address;
  @CategoryEntityConverter()
  final CategoryEntity category;
  @WorkTypeConverter()
  final WorkType workType;
  @JsonKey(name: 'employer_info', defaultValue: '')
  final String employerInfo;
  @JsonKey(name: 'published_at', defaultValue: '')
  final String publishedAt;
  @JsonKey(name: 'is_favorite', defaultValue: false)
  final bool isFavorite;
  @JsonKey(name: 'requirements', defaultValue: [])
  final List<dynamic> requirements;
  @JsonKey(name: 'obligations', defaultValue: [])
  final List<dynamic> obligations;

  const VacancyListEntity({
    required this.workType,
    required this.title,
    required this.category,
    required this.id,
    required this.organization,
    required this.address,
    required this.slug,
    required this.salaryFrom,
    required this.description,
    required this.salaryTo,
    required this.requirements,
    required this.employerInfo,
    required this.experienceFrom,
    required this.isFavorite,
    required this.obligations,
    required this.publishedAt,
    required this.experienceTo,
  });

  List<Object?> get props => [
        workType,
        title,
        category,
        id,
        organization,
        address,
        slug,
        salaryFrom,
        description,
        salaryTo,
        requirements,
        employerInfo,
        experienceFrom,
        isFavorite,
        obligations,
        publishedAt,
      ];
}

class WorkType extends Equatable {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'label', defaultValue: '')
  final String label;

  const WorkType({required this.label, required this.name});

  @override
  List<Object?> get props => [name, label];
}

class WorkTypeConverter extends JsonConverter<WorkType, Map<String, dynamic>?> {
  const WorkTypeConverter();

  @override
  WorkType fromJson(Map<String, dynamic>? json) =>
      WorkTypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(WorkType object) => {};
}

class CategoryEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  const CategoryEntity({this.id = 0, this.title = ''});

  @override
  List<Object?> get props => [id, title];
}

class CategoryEntityConverter
    extends JsonConverter<CategoryEntity, Map<String, dynamic>?> {
  const CategoryEntityConverter();

  @override
  CategoryEntity fromJson(Map<String, dynamic>? json) =>
      CategoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CategoryEntity object) => {};
}

class OrganizationEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @LogoEntityConverter()
  final LogoEntity logo;
  @JsonKey(name: 'images', defaultValue: [])
  final List<ImageModel> images;
  @JsonKey(name: 'address', defaultValue: '')
  final String address;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @JsonKey(name: 'phone_numbers', defaultValue: [])
  final List<PhoneNumberModel> phoneNumbers;
  @JsonKey(name: 'rating', defaultValue: 0)
  final double rating;
  @JsonKey(name: 'specialization', defaultValue: [])
  final List<SpecializationModel> speciazilation;
  @JsonKey(name: 'types', defaultValue: [])
  final List<TypesModel> types;
  @JsonKey(name: 'location_url', defaultValue: '')
  final String locationUrl;

  const OrganizationEntity({
    required this.title,
    required this.id,
    required this.phoneNumber,
    required this.phoneNumbers,
    required this.slug,
    required this.address,
    required this.images,
    required this.locationUrl,
    required this.rating,
    required this.speciazilation,
    required this.types,
    required this.logo,
  });

  @override
  List<Object?> get props => [
        title,
        id,
        phoneNumber,
        phoneNumbers,
        slug,
        address,
        images,
        locationUrl,
        rating,
        speciazilation,
        types,
        logo
      ];
}

class OrganizationEntityConverter
    extends JsonConverter<OrganizationEntity, Map<String, dynamic>?> {
  const OrganizationEntityConverter();

  @override
  OrganizationEntity fromJson(Map<String, dynamic>? json) =>
      OrganizationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(OrganizationEntity object) => {};
}

class PhoneNumberEntity extends Equatable {
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;

  const PhoneNumberEntity({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}



class TypesEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  const TypesEntity({required this.title, required this.id});

  @override
  List<Object?> get props => [id, title];
}
