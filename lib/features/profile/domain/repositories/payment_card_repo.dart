import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/models/craete_card_response_model.dart';
import 'package:anatomica/features/profile/domain/entities/payment_card_entity.dart';

abstract class PaymentCardRepository {
  const PaymentCardRepository();

  Future<Either<Failure, GenericPagination<PaymentCardEntity>>> getPaymentCards(
      {String? next});

  Future<Either<Failure, String>> confirmPaymentCards(
      {required int session, required String otp, required String cardNumber});

  Future<Either<Failure, CreateCardResponseModel>> createPaymentCards(
      {required String cardNumber, required String expireDate});

  Future<Either<Failure, void>> deletePaymentCards(int id);
}
