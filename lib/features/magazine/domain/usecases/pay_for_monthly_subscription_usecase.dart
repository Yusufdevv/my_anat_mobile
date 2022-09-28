import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/magazine/domain/entities/payment_response_entity.dart';
import 'package:anatomica/features/magazine/domain/repositories/payment_repository.dart';

class PayForMonthlySubscriptionUseCase implements UseCase<PaymentResponseEntity, SubscriptionParams> {
  final PaymentRepository repository;
  PayForMonthlySubscriptionUseCase({required this.repository});
  @override
  Future<Either<Failure, PaymentResponseEntity>> call(SubscriptionParams params) async =>
      await repository.payForMonthlySubscription(numOfMoths: params.period, paymentProvider: params.paymentProvider);
}

class SubscriptionParams {
  final int period;
  final String paymentProvider;
  const SubscriptionParams({required this.paymentProvider, required this.period});
}
