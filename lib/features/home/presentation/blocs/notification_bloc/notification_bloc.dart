import 'dart:developer';
import 'dart:ui';

import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/home/data/models/notification_model.dart';
import 'package:anatomica/features/home/data/repository_impls/notification_repo_impl.dart';
import 'package:anatomica/features/home/domain/entities/unread_notifications_entity.dart';
import 'package:anatomica/features/home/domain/usecases/notification_single_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/notifications_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/read_all_notification_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/read_notification_usecase.dart';
import 'package:anatomica/features/home/domain/usecases/unread_notifications_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final UnreadNotificationsUsecase _unreadNotificationsUsecase =
      UnreadNotificationsUsecase(
          repository: serviceLocator<NotificationRepoImpl>());
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
    on<_UnreadNotifications>(_unreadNotifications);
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

  _unreadNotifications(
      _UnreadNotifications event, Emitter<NotificationState> emit) async {
    final response = await _unreadNotificationsUsecase.call(NoParams());
    if (response.isRight) {
      print('response => ${response.right}');
      emit(state.copyWith(
        unreadNotification: response.right,
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
      log('response => ${response.right}');
      state.notifications.map((e) {
        print('read elements ${e.id} => ${e.read}');
      });
      List<NotificationModel> list = [...state.notifications];
      list.insert(
          list.indexWhere((element) => element.id == event.id), response.right);
      list.removeAt(list.lastIndexWhere((element) => element.id == event.id));
      list.map((e) {
        print('read elements list ${e.id} => ${e.read}');
      });

      emit(
        state.copyWith(
          notificationSingleStatus: FormzStatus.submissionSuccess,
          notificationSingle: response.right,
          notifications: list,
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
