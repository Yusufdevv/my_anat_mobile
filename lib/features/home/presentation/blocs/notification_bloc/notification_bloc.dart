import 'dart:ui';

import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/home/data/models/notification_model.dart';
import 'package:anatomica/features/home/data/repository_impls/notification_repo_impl.dart';
import 'package:anatomica/features/home/domain/usecases/notification_single_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/notifications_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/read_all_notification_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/read_notification_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationSingleUsecase _notificationSingleUsecase =
      NotificationSingleUsecase(
          repository: serviceLocator<NotificationRepoImpl>());
  final NotificationsUsecase _notificationsUsecase =
      NotificationsUsecase(repository: serviceLocator<NotificationRepoImpl>());
  final ReadAllNotificationUsecase _readAllNotificationUsecase =
      ReadAllNotificationUsecase(
          repository: serviceLocator<NotificationRepoImpl>());
  final ReadNotificationUsecase _readNotificationUsecase =
      ReadNotificationUsecase(
          repository: serviceLocator<NotificationRepoImpl>());

  NotificationBloc() : super(NotificationState()) {
    on<_GetNotifications>(_getNotifications);
    on<_GetMoreNotifications>(_getMoreNotifications);
    on<_GetNotificationSingle>(_getNotificationSingle);
    on<_ReadAllNotificattions>(_readAllNotificattions);
    on<_ReadNotification>(_readNotification);
    // on<_PostDeviceId>(_postDeviceId);
  }

  _getNotifications(
      _GetNotifications event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(notificationsStatus: FormzStatus.submissionInProgress));
    final response = await _notificationsUsecase.call(null);
    if (response.isRight) {
      print('response => ${response.right}');
      emit(state.copyWith(
        notificationsNext: response.right.next,
        notificationsStatus: FormzStatus.submissionSuccess,
        notificationsFetchMore: response.right.next != null,
        notifications: response.right.results,
      ));
    }
  }

  _getMoreNotifications(
      _GetMoreNotifications event, Emitter<NotificationState> emit) async {
    final response = await _notificationsUsecase.call(state.notificationsNext);
    if (response.isRight) {
      emit(state.copyWith(
        notificationsNext: response.right.next,
        notificationsFetchMore: response.right.next != null,
        notifications: [...state.notifications, ...response.right.results],
      ));
    }
  }

  _getNotificationSingle(
      _GetNotificationSingle event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(
        notificationSingleStatus: FormzStatus.submissionInProgress));
    final response = await _notificationSingleUsecase.call(event.id);
    if (response.isRight) {
      print('response => ${response.right}');
      emit(
        state.copyWith(
          notificationSingleStatus: FormzStatus.submissionSuccess,
          notificationSingle: response.right,
        ),
      );
    }
  }

  _readAllNotificattions(
      _ReadAllNotificattions event, Emitter<NotificationState> emit) async {
    final response = await _readAllNotificationUsecase.call(null);
    if (response.isRight) {}
  }

  _readNotification(
      _ReadNotification event, Emitter<NotificationState> emit) async {
    final response = await _readNotificationUsecase.call(event.id);
    if (response.isRight) {}
  }

// _postDeviceId(_PostDeviceId event, Emitter<NotificationState> emit) async {
//   final response = await _postDeviceId.call(event.slug);
//   if (response.isRight) {
//   }
// }
}
