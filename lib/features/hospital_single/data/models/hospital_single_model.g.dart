// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalSingleModel _$HospitalSingleModelFromJson(Map<String, dynamic> json) =>
    HospitalSingleModel(
      slug: json['slug'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
      email: json['email'] as String? ?? '',
      website: json['website'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      facebook: json['facebook'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) =>
                  const ImageConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      id: json['id'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      description: json['description'] as String? ?? '',
      title: json['title'] as String? ?? '',
      logo: json['logo'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['logo'] as Map<String, dynamic>?),
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      commentCount: json['comment_count'] as int? ?? 0,
      district: json['district'] == null
          ? const DistrictEntity()
          : const DistrictConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      region: json['region'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      locationUrl: json['location_url'] as String? ?? '',
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => const PhoneNumberConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      types: (json['types'] as List<dynamic>?)
              ?.map((e) =>
                  const TypeConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      specialization: (json['specialization'] as List<dynamic>?)
              ?.map((e) => const SpecializationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      moderationStatus: json['moderation_status'] as String? ?? '',
      certificate: json['certificate'] == null
          ? const HospitalCertificateEntity()
          : const HospitalCertificateConverter()
              .fromJson(json['certificate'] as Map<String, dynamic>?),
      workAllDay: json['work_all_day'] as bool? ?? false,
      workFrom: json['work_from'] as String? ?? '',
      workTo: json['work_to'] as String? ?? '',
      videoLink: json['video_link'] as String? ?? '',
      videos: (json['videos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      paid: json['paid'] as bool? ?? false,
      videoDescription: json['video_description'] as String? ?? '',
    );

Map<String, dynamic> _$HospitalSingleModelToJson(
        HospitalSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'images': instance.images.map(const ImageConverter().toJson).toList(),
      'logo': const ImageConverter().toJson(instance.logo),
      'specialization': instance.specialization
          .map(const SpecializationConverter().toJson)
          .toList(),
      'location_url': instance.locationUrl,
      'phone_number': instance.phoneNumber,
      'phone_numbers': instance.phoneNumbers
          .map(const PhoneNumberConverter().toJson)
          .toList(),
      'description': instance.description,
      'work_from': instance.workFrom,
      'work_to': instance.workTo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'certificate':
          const HospitalCertificateConverter().toJson(instance.certificate),
      'region': const RegionConverter().toJson(instance.region),
      'district': const DistrictConverter().toJson(instance.district),
      'types': instance.types.map(const TypeConverter().toJson).toList(),
      'rating': instance.rating,
      'comment_count': instance.commentCount,
      'address': instance.address,
      'moderation_status': instance.moderationStatus,
      'email': instance.email,
      'website': instance.website,
      'instagram': instance.instagram,
      'facebook': instance.facebook,
      'telegram': instance.telegram,
      'work_all_day': instance.workAllDay,
      'paid': instance.paid,
      'video_link': instance.videoLink,
      'video_description': instance.videoDescription,
      'videos': instance.videos,
    };
