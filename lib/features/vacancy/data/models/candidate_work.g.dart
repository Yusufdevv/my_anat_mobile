// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateWorkModel _$CandidateWorkModelFromJson(Map<String, dynamic> json) =>
    CandidateWorkModel(
      organization: const CandidateOrganizationConverter()
          .fromJson(json['organization'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      position: json['position'] as String? ?? '',
      isMain: json['is_main'] as bool? ?? false,
    );

Map<String, dynamic> _$CandidateWorkModelToJson(CandidateWorkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization':
          const CandidateOrganizationConverter().toJson(instance.organization),
      'position': instance.position,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_main': instance.isMain,
    };

CandidateOrganizationModel _$CandidateOrganizationModelFromJson(
        Map<String, dynamic> json) =>
    CandidateOrganizationModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      logo: const LogoEntityConverter()
          .fromJson(json['logo'] as Map<String, dynamic>?),
      slug: json['slug'] as String? ?? '',
      address: json['address'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      specialization: const SpecializationConverter()
          .fromJson(json['specialization'] as Map<String, dynamic>?),
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      types: const TypeConverter()
          .fromJson(json['types'] as Map<String, dynamic>?),
      locationUrl: json['location_url'] as String? ?? '',
      images: const ImageConverter()
          .fromJson(json['images'] as Map<String, dynamic>?),
      workAllDay: json['work_all_day'] as bool? ?? false,
    );

Map<String, dynamic> _$CandidateOrganizationModelToJson(
        CandidateOrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'logo': const LogoEntityConverter().toJson(instance.logo),
      'images': const ImageConverter().toJson(instance.images),
      'address': instance.address,
      'phone_numbers': instance.phoneNumbers,
      'rating': instance.rating,
      'specialization':
          const SpecializationConverter().toJson(instance.specialization),
      'types': const TypeConverter().toJson(instance.types),
      'location_url': instance.locationUrl,
      'work_all_day': instance.workAllDay,
    };
