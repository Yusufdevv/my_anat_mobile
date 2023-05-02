import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/domain/entities/unread_notifications_entity.dart';
import 'package:anatomica/features/home/domain/repositories/notification_repository.dart';

class UnreadNotificationsUsecase
    implements UseCase<UnreadNotificationsEntity, NoParams> {
  final NotificationRepository repository;
  UnreadNotificationsUsecase({required this.repository});
  @override
  Future<Either<Failure, UnreadNotificationsEntity>> call(
          NoParams params) async =>
      await repository.unreadNotifications();
}
