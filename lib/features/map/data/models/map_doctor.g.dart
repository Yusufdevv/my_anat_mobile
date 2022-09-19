// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapDoctorModel _$MapDoctorModelFromJson(Map<String, dynamic> json) =>
    MapDoctorModel(
      hospital:
          MapHospitalModel.fromJson(json['hospital'] as Map<String, dynamic>),
      doctor: const HospitalDoctorsConverter()
          .fromJson(json['doctor'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$MapDoctorModelToJson(MapDoctorModel instance) =>
    <String, dynamic>{
      'doctor': const HospitalDoctorsConverter().toJson(instance.doctor),
      'hospital': instance.hospital,
    };
