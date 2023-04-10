import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/models/notification_model.dart';
import 'package:anatomica/features/home/domain/repositories/notification_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class NotificationsUsecase
    implements UseCase<GenericPagination<NotificationModel>, String?> {
  final NotificationRepository repository;

  NotificationsUsecase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<NotificationModel>>> call(
          String? params) async =>
      await repository.getNotifications(next: params);
}
