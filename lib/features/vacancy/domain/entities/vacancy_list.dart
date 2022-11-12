import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/phone_number_entity.dart';
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
  final List<RequirementsModel> requirements;
  @JsonKey(name: 'obligations', defaultValue: [])
  final List<RequirementsModel> obligations;

  const VacancyListEntity({
    this.workType = const WorkType(),
    this.title = '',
    this.category = const CategoryEntity(),
    this.id = 0,
    this.organization = const OrganizationEntity(),
    this.address = '',
    this.slug = '',
    this.salaryFrom = 0,
    this.description = '',
    this.salaryTo = 0,
    this.requirements = const [],
    this.employerInfo = '',
    this.experienceFrom = 0,
    this.isFavorite = false,
    this.obligations = const [],
    this.publishedAt = '',
    this.experienceTo = 0,
  });
  @override
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

  VacancyListEntity copyWith({
    final int? id,
    final String? title,
    final String? slug,
    final OrganizationEntity? organization,
    final int? salaryFrom,
    final int? salaryTo,
    final int? experienceFrom,
    final int? experienceTo,
    final String? description,
    final String? address,
    final CategoryEntity? category,
    final WorkType? workType,
    final String? employerInfo,
    final String? publishedAt,
    final bool? isFavorite,
    final List<RequirementsModel>? requirements,
    final List<RequirementsModel>? obligations,
  }) =>
      VacancyListEntity(
        id: id ?? this.id,
        category: category ?? this.category,
        address: address ?? this.address,
        description: description ?? this.description,
        employerInfo: employerInfo ?? this.employerInfo,
        experienceFrom: experienceFrom ?? this.experienceFrom,
        experienceTo: experienceTo ?? this.experienceTo,
        isFavorite: isFavorite ?? this.isFavorite,
        obligations: obligations ?? this.obligations,
        organization: organization ?? this.organization,
        publishedAt: publishedAt ?? this.publishedAt,
        requirements: requirements ?? this.requirements,
        salaryFrom: salaryFrom ?? this.salaryFrom,
        salaryTo: salaryTo ?? this.salaryTo,
        slug: slug ?? this.slug,
        title: title ?? this.title,
        workType: workType ?? this.workType,
      );
}

class WorkType extends Equatable {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'label', defaultValue: '')
  final String label;

  const WorkType({
    this.label = '',
    this.name = '',
  });

  @override
  List<Object?> get props => [name, label];
}

class WorkTypeConverter extends JsonConverter<WorkType, Map<String, dynamic>?> {
  const WorkTypeConverter();

  @override
  WorkType fromJson(Map<String, dynamic>? json) => WorkTypeModel.fromJson(json ?? {});

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

class CategoryEntityConverter extends JsonConverter<CategoryEntity, Map<String, dynamic>?> {
  const CategoryEntityConverter();

  @override
  CategoryEntity fromJson(Map<String, dynamic>? json) => CategoryModel.fromJson(json ?? {});

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
  @PhoneNumberConverter()
  final List<PhoneNumberEntity> phoneNumbers;
  @JsonKey(name: 'rating', defaultValue: 0)
  final double rating;
  @JsonKey(name: 'specialization', defaultValue: [])
  final List<SpecializationModel> speciazilation;
  @JsonKey(name: 'types', defaultValue: [])
  final List<TypesModel> types;
  @JsonKey(name: 'location_url', defaultValue: '')
  final String locationUrl;

  const OrganizationEntity({
    this.title = '',
    this.id = 0,
    this.phoneNumber = '',
    this.phoneNumbers = const [],
    this.slug = '',
    this.address = '',
    this.images = const [],
    this.locationUrl = '',
    this.rating = 0,
    this.speciazilation = const [],
    this.types = const [],
    this.logo = const LogoEntity(),
  });

  @override
  List<Object?> get props =>
      [title, id, phoneNumber, phoneNumbers, slug, address, images, locationUrl, rating, speciazilation, types, logo];
}

class OrganizationEntityConverter extends JsonConverter<OrganizationEntity, Map<String, dynamic>?> {
  const OrganizationEntityConverter();

  @override
  OrganizationEntity fromJson(Map<String, dynamic>? json) => OrganizationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(OrganizationEntity object) => {};
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

class RequirementsEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 'description')
  final String description;

  const RequirementsEntity({
    required this.id,
    required this.description,
  });

  @override
  List<Object?> get props => [id, description];
}
