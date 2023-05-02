// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnreadNotificationsModel _$UnreadNotificationsModelFromJson(
        Map<String, dynamic> json) =>
    UnreadNotificationsModel(
      count: json['count'] as int? ?? 0,
      unread: json['unread'] as bool? ?? false,
    );

Map<String, dynamic> _$UnreadNotificationsModelToJson(
        UnreadNotificationsModel instance) =>
    <String, dynamic>{
      'unread': instance.unread,
      'count': instance.count,
    };
