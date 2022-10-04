import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/payment_response_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/payment_repository.dart';
import 'package:anatomica/features/journal/domain/usecases/order_create_article_usecase.dart';

class OrderCreateJournalUseCase implements UseCase<PaymentResponseEntity, OrderCreateParams> {
  final PaymentRepository repository;
  OrderCreateJournalUseCase({required this.repository});
  @override
  Future<Either<Failure, PaymentResponseEntity>> call(OrderCreateParams params) async =>
      await repository.orderCreateJournal(
        journalId: params.id,
        price: params.price,
        phoneNumber: params.phoneNumber,
        email: params.email,
        paymentProvider: params.paymentProvider,
        isRegistered: params.isRegistered,
      );
}
