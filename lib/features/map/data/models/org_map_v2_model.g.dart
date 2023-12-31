// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_map_v2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgMapV2Model _$OrgMapV2ModelFromJson(Map<String, dynamic> json) =>
    OrgMapV2Model(
      service: (json['service'] as List<dynamic>?)
              ?.map((e) => const IdNameUrlConverter()
                  .fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <IdNameUrlEntity>[],
      workAllDay: json['work_all_day'] as bool? ?? false,
      id: json['id'] as int? ?? -1,
      phoneNumber: json['phone_number'] as String? ?? '',
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => const SpecializationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      specialization: (json['specialization'] as List<dynamic>?)
              ?.map((e) => const SpecializationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      district: json['district'] == null
          ? const DistrictEntity()
          : const DistrictConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
      region: json['region'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      workTo: json['work_to'] as String? ?? '',
      workFrom: json['work_from'] as String? ?? '',
      title: json['title'] as String? ?? '',
      inn: json['inn'] as String? ?? '',
      logo: json['logo'] == null
          ? const LogoEntity()
          : const LogoEntityConverter()
              .fromJson(json['logo'] as Map<String, dynamic>?),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => const LogoEntityConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      slug: json['slug'] as String? ?? '',
      paid: json['paid'] as bool? ?? false,
      subscribeFrom: json['subscribe_from'] as String? ?? '',
      subscribeUpto: json['subscribe_upto'] as String? ?? '',
    );

Map<String, dynamic> _$OrgMapV2ModelToJson(OrgMapV2Model instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'images':
          instance.images.map(const LogoEntityConverter().toJson).toList(),
      'logo': const LogoEntityConverter().toJson(instance.logo),
      'inn': instance.inn,
      'work_from': instance.workFrom,
      'work_to': instance.workTo,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'region': const RegionConverter().toJson(instance.region),
      'district': const DistrictConverter().toJson(instance.district),
      'address': instance.address,
      'rating': instance.rating,
      'specialization': instance.specialization
          .map(const SpecializationConverter().toJson)
          .toList(),
      'types':
          instance.types.map(const SpecializationConverter().toJson).toList(),
      'service':
          instance.service.map(const IdNameUrlConverter().toJson).toList(),
      'phone_number': instance.phoneNumber,
      'distance': instance.distance,
      'work_all_day': instance.workAllDay,
      'subscribe_from': instance.subscribeFrom,
      'subscribe_upto': instance.subscribeUpto,
      'paid': instance.paid,
    };
