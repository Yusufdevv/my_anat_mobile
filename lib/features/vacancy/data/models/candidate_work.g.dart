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
      logo: json['logo'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      address: json['address'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      specialization: (json['specialization'] as List<dynamic>?)
              ?.map((e) =>
                  SpecializationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => PhoneNumberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      locationUrl: json['location_url'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      workAllDay: json['work_all_day'] as bool? ?? false,
    );

Map<String, dynamic> _$CandidateOrganizationModelToJson(
        CandidateOrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'logo': instance.logo,
      'images': instance.images,
      'address': instance.address,
      'phone_numbers': instance.phoneNumbers,
      'rating': instance.rating,
      'specialization': instance.specialization,
      'types': instance.types,
      'location_url': instance.locationUrl,
      'work_all_day': instance.workAllDay,
    };
