import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/data/models/craete_card_response_model.dart';
import 'package:anatomica/features/profile/data/repositories/payment_card_repo_impl.dart';
import 'package:anatomica/features/profile/domain/repositories/payment_card_repo.dart';

class CreatePaymentCardsUseCase implements UseCase<CreateCardResponseModel, CreateCardParam> {
  final PaymentCardRepository repository =
      serviceLocator<PaymentCardRepositoryImpl>();

  @override
  Future<Either<Failure, CreateCardResponseModel>> call(CreateCardParam params) async =>
      await repository.createPaymentCards(
          expireDate: params.expireDate, cardNumber: params.cardNumber);
}

class CreateCardParam {
  final String expireDate;
  final String cardNumber;

  CreateCardParam({required this.expireDate, required this.cardNumber});
}
