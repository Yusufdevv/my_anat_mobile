import 'package:anatomica/features/home/domain/entities/unread_notifications_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'unread_notifications_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UnreadNotificationsModel extends UnreadNotificationsEntity {
  const UnreadNotificationsModel({
    required super.count,
    required super.unread,
  });

  factory UnreadNotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$UnreadNotificationsModelFromJson(json);
}
