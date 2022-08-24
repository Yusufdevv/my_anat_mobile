// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    DistrictModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      soato: json['soato'] as String? ?? '',
      region: json['region'] == null
          ? null
          : RegionModel.fromJson(json['region'] as Map<String, dynamic>),
    );
