import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/home/domain/entities/notification_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.title,
    required super.type,
    required super.read,
    required super.image,
    required super.id,
    required super.createdAt,
    required super.content,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
