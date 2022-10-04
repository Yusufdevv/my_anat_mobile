// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesModel _$PricesModelFromJson(Map<String, dynamic> json) => PricesModel(
      organizationSubscribe: json['organization_subscribe'] as int? ?? 0,
      journalSubscribe: json['journal_subscribe'] as int? ?? 0,
      doctorSubscribe: json['doctor_subscribe'] as int? ?? 0,
      articlePublish: json['article_publish'] as int? ?? 0,
    );

Map<String, dynamic> _$PricesModelToJson(PricesModel instance) =>
    <String, dynamic>{
      'journal_subscribe': instance.journalSubscribe,
      'doctor_subscribe': instance.doctorSubscribe,
      'organization_subscribe': instance.organizationSubscribe,
      'article_publish': instance.articlePublish,
    };
