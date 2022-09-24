// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapDoctorModel _$MapDoctorModelFromJson(Map<String, dynamic> json) =>
    MapDoctorModel(
      hospital: MapHospitalModel.fromJson(
          json['organization'] as Map<String, dynamic>),
      doctor: DoctorSpecModel.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MapDoctorModelToJson(MapDoctorModel instance) =>
    <String, dynamic>{
      'doctor': instance.doctor,
      'organization': instance.hospital,
    };
