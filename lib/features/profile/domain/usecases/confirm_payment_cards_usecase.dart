import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/data/repositories/payment_card_repo_impl.dart';
import 'package:anatomica/features/profile/domain/repositories/payment_card_repo.dart';

class ConfirmPaymentCardsUseCase implements UseCase<String, ConfirmCardParam> {
  final PaymentCardRepository repository =
      serviceLocator<PaymentCardRepositoryImpl>();

  @override
  Future<Either<Failure, String>> call(ConfirmCardParam params) async => await repository
      .confirmPaymentCards(session: params.session, otp: params.otp, cardNumber: params.cardNumber);
}

class ConfirmCardParam {
  final int session;
  final String otp;
  final String cardNumber;

  ConfirmCardParam(
      {required this.session, required this.otp, required this.cardNumber});
}
