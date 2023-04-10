import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/models/device_id_model.dart';
import 'package:anatomica/features/home/data/models/notification_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class NotificationRepository {
  Future<Either<Failure, GenericPagination<NotificationModel>>>
      getNotifications({String? next});

  Future<Either<Failure, NotificationModel>> getNotificationSingle(
      {required int id});

  Future<Either<Failure, void>> readAllNotificattions();

  Future<Either<Failure, void>> readNotification({required int id});

  Future<Either<Failure, DeviceIdModel>> postDeviceId({required int id});
}
