import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/domain/repositories/notification_repository.dart';

class ReadAllNotificationUsecase implements UseCase<void, String?> {
  final NotificationRepository repository;

  ReadAllNotificationUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String? params) async =>
      await repository.readAllNotificattions();
}
