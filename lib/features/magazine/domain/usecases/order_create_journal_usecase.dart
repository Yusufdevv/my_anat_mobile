import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/magazine/domain/repositories/payment_repository.dart';
import 'package:anatomica/features/magazine/domain/usecases/order_create_article_usecase.dart';

class OrderCreateJournalUseCase implements UseCase<String, OrderCreateParams> {
  final PaymentRepository repository;
  OrderCreateJournalUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(OrderCreateParams params) async => await repository.orderCreateJournal(
        journalId: params.id,
        price: params.price,
        phoneNumber: params.phoneNumber,
        email: params.email,
        paymentProvider: params.paymentProvider,
        isRegistered: params.isRegistered,
      );
}
