// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateListModel _$CandidateListModelFromJson(Map<String, dynamic> json) =>
    CandidateListModel(
      specialization: json['specialization'] == null
          ? const SpecializationEntity()
          : const SpecializationConverter()
              .fromJson(json['specialization'] as Map<String, dynamic>?),
      phoneNumber: json['phone_number'] as String? ?? '',
      address: json['address'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      image: json['image'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['image'] as Map<String, dynamic>?),
      fullName: json['full_name'] as String? ?? '',
      position: json['position'] as String? ?? '',
      workExperience: json['work_experience'] as int? ?? 0,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$CandidateListModelToJson(CandidateListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'image': const ImageConverter().toJson(instance.image),
      'specialization':
          const SpecializationConverter().toJson(instance.specialization),
      'position': instance.position,
      'phone_number': instance.phoneNumber,
      'work_experience': instance.workExperience,
      'address': instance.address,
      'rating': instance.rating,
      'is_favorite': instance.isFavorite,
    };
