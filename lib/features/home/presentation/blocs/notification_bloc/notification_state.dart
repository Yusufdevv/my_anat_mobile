part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  factory NotificationState({
    @Default([]) List<NotificationModel> notifications,
    NotificationModel? notificationSingle,
    @Default(FormzStatus.pure) FormzStatus notificationsStatus,
    @Default(FormzStatus.pure) FormzStatus notificationSingleStatus,
    String? notificationsNext,
    @Default(false) bool notificationsFetchMore,
    UnreadNotificationsEntity? unreadNotification,
  }) = _NotificationState;
}
