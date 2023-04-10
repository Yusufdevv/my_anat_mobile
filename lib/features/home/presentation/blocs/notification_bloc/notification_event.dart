part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.getNotifications() = _GetNotifications;

  const factory NotificationEvent.getMoreNotifications() =
      _GetMoreNotifications;

  const factory NotificationEvent.getNotificationSingle({required int id}) =
      _GetNotificationSingle;

  const factory NotificationEvent.readAllNotificattions(
      {VoidCallback? onSuccess,
      VoidCallback? onError}) = _ReadAllNotificattions;

  const factory NotificationEvent.readNotification(
      {VoidCallback? onSuccess,
      VoidCallback? onError,
      required int id}) = _ReadNotification;

  const factory NotificationEvent.postDeviceId({required int deviceId}) =
      _PostDeviceId;
}
