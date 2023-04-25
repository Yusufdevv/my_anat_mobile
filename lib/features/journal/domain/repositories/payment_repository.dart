import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/payment_response_entity.dart';
import 'package:anatomica/features/journal/domain/entities/prices_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentResponseEntity>> orderCreateJournal({
    required int journalId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
    required int card,
  });
  Future<Either<Failure, PaymentResponseEntity>> orderCreateArticle({
    required int articleId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
    required int card,
  });
  Future<Either<Failure, String>> checkPaymentStatus({required int id});
  Future<Either<Failure, PaymentResponseEntity>> payForMonthlySubscription(
      {required int numOfMoths, required String paymentProvider,  required bool autoReNewJournal});
  Future<Either<Failure, PricesEntity>> getPrices();
}
