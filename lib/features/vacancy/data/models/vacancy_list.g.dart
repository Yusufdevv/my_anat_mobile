// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacancyListModel _$VacancyListModelFromJson(Map<String, dynamic> json) =>
    VacancyListModel(
      workType: const WorkTypeConverter()
          .fromJson(json['workType'] as Map<String, dynamic>?),
      title: json['title'] as String? ?? '',
      category: const CategoryEntityConverter()
          .fromJson(json['category'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      organization: const OrganizationEntityConverter()
          .fromJson(json['organization'] as Map<String, dynamic>?),
      address: json['address'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      salaryFrom: json['salary_from'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      salaryTo: json['salary_to'] as int? ?? 0,
      requirements: json['requirements'] as List<dynamic>? ?? [],
      employerInfo: json['employer_info'] as String? ?? '',
      experienceFrom: json['experience_from'] as int? ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
      obligations: json['obligations'] as List<dynamic>? ?? [],
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
      'workType': const WorkTypeConverter().toJson(instance.workType),
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
              ?.map((e) => PhoneNumberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
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
      logo: const LogoEntityConverter()
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
      'phone_numbers': instance.phoneNumbers,
      'rating': instance.rating,
      'specialization': instance.speciazilation,
      'types': instance.types,
      'location_url': instance.locationUrl,
    };

PhoneNumberModel _$PhoneNumberModelFromJson(Map<String, dynamic> json) =>
    PhoneNumberModel(
      phoneNumber: json['phone_number'] as String? ?? '',
    );

Map<String, dynamic> _$PhoneNumberModelToJson(PhoneNumberModel instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
    };

SpecializationModel _$SpecializationModelFromJson(Map<String, dynamic> json) =>
    SpecializationModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$SpecializationModelToJson(
        SpecializationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
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

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      origin: json['origin'] as String? ?? '',
      small: json['small'] as String? ?? '',
      middle: json['middle'] as String? ?? '',
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'middle': instance.middle,
      'small': instance.small,
    };
