import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/data/repositories/payment_card_repo_impl.dart';
import 'package:anatomica/features/profile/domain/repositories/payment_card_repo.dart';

class DeletePaymentCardsUseCase implements UseCase<void, int> {
  final PaymentCardRepository repository = serviceLocator<PaymentCardRepositoryImpl>();
  @override
  Future<Either<Failure, void>> call(int params) async =>
      await repository.deletePaymentCards(params);
}
