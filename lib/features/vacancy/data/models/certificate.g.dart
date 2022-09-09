// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateModel _$CertificateModelFromJson(Map<String, dynamic> json) =>
    CertificateModel(
      id: json['id'] as int? ?? 0,
      specialization: const SpecializationConverter()
          .fromJson(json['specialization'] as Map<String, dynamic>?),
      title: json['title'] as String? ?? '',
      date: json['date'] as String? ?? '',
      certificateNumber: json['certificate_number'] as String? ?? '',
    );

Map<String, dynamic> _$CertificateModelToJson(CertificateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'specialization':
          const SpecializationConverter().toJson(instance.specialization),
      'certificate_number': instance.certificateNumber,
      'date': instance.date,
    };
