import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/models/notification_model.dart';
import 'package:anatomica/features/home/domain/repositories/notification_repository.dart';

class NotificationSingleUsecase implements UseCase<NotificationModel, int> {
  final NotificationRepository repository;

  NotificationSingleUsecase({required this.repository});

  @override
  Future<Either<Failure, NotificationModel>> call(int param) async =>
      await repository.getNotificationSingle(id: param);
}
