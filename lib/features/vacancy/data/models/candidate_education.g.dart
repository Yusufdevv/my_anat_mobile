// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateEducationModel _$CandidateEducationModelFromJson(
        Map<String, dynamic> json) =>
    CandidateEducationModel(
      place: json['place'] as String,
      id: json['id'] as int? ?? 0,
      endDate: json['end_date'] as String? ?? '',
      startDate: json['start_date'] as String? ?? '',
      degree: json['degree'] as String? ?? '',
      course: json['course'] as String,
    );

Map<String, dynamic> _$CandidateEducationModelToJson(
        CandidateEducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'place': instance.place,
      'course': instance.course,
      'degree': instance.degree,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

UniversityModel _$UniversityModelFromJson(Map<String, dynamic> json) =>
    UniversityModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      logo: const LogoEntityConverter()
          .fromJson(json['logo'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$UniversityModelToJson(UniversityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'logo': const LogoEntityConverter().toJson(instance.logo),
    };

FacultyModel _$FacultyModelFromJson(Map<String, dynamic> json) => FacultyModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$FacultyModelToJson(FacultyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
