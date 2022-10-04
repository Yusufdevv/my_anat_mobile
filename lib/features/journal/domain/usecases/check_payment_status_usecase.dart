import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/repositories/payment_repository.dart';

class CheckPaymentStatusUseCase implements UseCase<String, int> {
  final PaymentRepository repository;
  CheckPaymentStatusUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(int params) async => repository.checkPaymentStatus(id: params);
}
