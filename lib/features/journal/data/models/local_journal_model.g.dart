// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_journal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalJournalModel _$LocalJournalModelFromJson(Map<String, dynamic> json) =>
    LocalJournalModel(
      imageUrl: json['image_url'] as String,
      journalId: json['journal_id'] as int,
      redaction: json['redaction'] as String,
    );

Map<String, dynamic> _$LocalJournalModelToJson(LocalJournalModel instance) =>
    <String, dynamic>{
      'journal_id': instance.journalId,
      'image_url': instance.imageUrl,
      'redaction': instance.redaction,
    };
