// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsModel _$DoctorsModelFromJson(Map<String, dynamic> json) => DoctorsModel(
      photo: json['image'] == null
          ? null
          : AssetModel.fromJson(json['image'] as Map<String, dynamic>),
      id: json['id'] as int? ?? 0,
      specializations:
          TitlerModel.fromJson(json['specialization'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      address: json['address'] as String? ?? '',
      position: json['position'] as String? ?? '',
      long: (json['long'] as num?)?.toDouble() ?? 0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0,
      fullName: json['full_name'] as String? ?? '',
    );

Map<String, dynamic> _$DoctorsModelToJson(DoctorsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'image': instance.photo,
      'position': instance.position,
      'address': instance.address,
      'rating': instance.rating,
      'lat': instance.lat,
      'long': instance.long,
      'specialization': instance.specializations,
    };
