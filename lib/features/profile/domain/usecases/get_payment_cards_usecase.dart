import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/repositories/payment_card_repo_impl.dart';
import 'package:anatomica/features/profile/domain/entities/payment_card_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/payment_card_repo.dart';

class GetPaymentCardsUseCase implements UseCase<GenericPagination<PaymentCardEntity>, String?> {
  final PaymentCardRepository repository = serviceLocator<PaymentCardRepositoryImpl>();
  @override
  Future<Either<Failure, GenericPagination<PaymentCardEntity>>> call(String? params) async =>
      await repository.getPaymentCards(next: params);
}
