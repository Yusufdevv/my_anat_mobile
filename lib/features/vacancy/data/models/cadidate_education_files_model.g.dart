// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadidate_education_files_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateEducationFilesModel _$CandidateEducationFilesModelFromJson(
        Map<String, dynamic> json) =>
    CandidateEducationFilesModel(
      id: json['id'] as int? ?? -1,
      document: json['document'] == null
          ? const DocumentFilesEntity()
          : const DocumentFilesEntityConverter()
              .fromJson(json['document'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$CandidateEducationFilesModelToJson(
        CandidateEducationFilesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document':
          const DocumentFilesEntityConverter().toJson(instance.document),
    };

DocumentFilesModel _$DocumentFilesModelFromJson(Map<String, dynamic> json) =>
    DocumentFilesModel(
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      size: json['size'] as int? ?? 0,
    );

Map<String, dynamic> _$DocumentFilesModelToJson(DocumentFilesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'size': instance.size,
    };
