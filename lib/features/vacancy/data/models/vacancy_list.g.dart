// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacancyListModel _$VacancyListModelFromJson(Map<String, dynamic> json) =>
    VacancyListModel(
      workType: json['work_type'] == null
          ? const WorkType()
          : const WorkTypeConverter()
              .fromJson(json['work_type'] as Map<String, dynamic>?),
      title: json['title'] as String? ?? '',
      category: json['category'] == null
          ? const CategoryEntity()
          : const CategoryEntityConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      organization: json['organization'] == null
          ? const OrganizationEntity()
          : const OrganizationEntityConverter()
              .fromJson(json['organization'] as Map<String, dynamic>?),
      address: json['address'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      salaryFrom: json['salary_from'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      salaryTo: json['salary_to'] as int? ?? 0,
      requirements: (json['requirements'] as List<dynamic>?)
              ?.map(
                  (e) => RequirementsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      employerInfo: json['employer_info'] as String? ?? '',
      experienceFrom: json['experience_from'] as int? ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
      obligations: (json['obligations'] as List<dynamic>?)
              ?.map(
                  (e) => RequirementsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      publishedAt: json['published_at'] as String? ?? '',
      experienceTo: json['experience_to'] as int? ?? 0,
    );

Map<String, dynamic> _$VacancyListModelToJson(VacancyListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'organization':
          const OrganizationEntityConverter().toJson(instance.organization),
      'salary_from': instance.salaryFrom,
      'salary_to': instance.salaryTo,
      'experience_from': instance.experienceFrom,
      'experience_to': instance.experienceTo,
      'description': instance.description,
      'address': instance.address,
      'category': const CategoryEntityConverter().toJson(instance.category),
      'work_type': const WorkTypeConverter().toJson(instance.workType),
      'employer_info': instance.employerInfo,
      'published_at': instance.publishedAt,
      'is_favorite': instance.isFavorite,
      'requirements': instance.requirements,
      'obligations': instance.obligations,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) =>
    OrganizationModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => const PhoneNumberConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      slug: json['slug'] as String? ?? '',
      address: json['address'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      locationUrl: json['location_url'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      speciazilation: (json['specialization'] as List<dynamic>?)
              ?.map((e) =>
                  SpecializationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => TypesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      logo: json['logo'] == null
          ? const LogoEntity()
          : const LogoEntityConverter()
              .fromJson(json['logo'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$OrganizationModelToJson(OrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'logo': const LogoEntityConverter().toJson(instance.logo),
      'images': instance.images,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'phone_numbers': instance.phoneNumbers
          .map(const PhoneNumberConverter().toJson)
          .toList(),
      'rating': instance.rating,
      'specialization': instance.speciazilation,
      'types': instance.types,
      'location_url': instance.locationUrl,
    };

TypesModel _$TypesModelFromJson(Map<String, dynamic> json) => TypesModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$TypesModelToJson(TypesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

WorkTypeModel _$WorkTypeModelFromJson(Map<String, dynamic> json) =>
    WorkTypeModel(
      label: json['label'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$WorkTypeModelToJson(WorkTypeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
    };

RequirementsModel _$RequirementsModelFromJson(Map<String, dynamic> json) =>
    RequirementsModel(
      id: json['id'] as int? ?? 0,
      description: json['description'] as String? ?? 'description',
    );

Map<String, dynamic> _$RequirementsModelToJson(RequirementsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
    };
