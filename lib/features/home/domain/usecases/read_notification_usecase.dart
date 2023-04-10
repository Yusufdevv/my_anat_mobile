import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/domain/repositories/notification_repository.dart';

class ReadNotificationUsecase implements UseCase<void, int> {
  final NotificationRepository repository;

  ReadNotificationUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(int param) async =>
      await repository.readNotification(id: param);
}
