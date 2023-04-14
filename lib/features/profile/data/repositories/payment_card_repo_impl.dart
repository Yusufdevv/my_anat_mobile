import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/datasources/payment_cards_data_source.dart';
import 'package:anatomica/features/profile/data/models/craete_card_response_model.dart';
import 'package:anatomica/features/profile/domain/entities/payment_card_entity.dart';
import 'package:anatomica/features/profile/domain/repositories/payment_card_repo.dart';

class PaymentCardRepositoryImpl extends PaymentCardRepository {
  final PaymentCardDatasource _datasource = serviceLocator<PaymentCardDatasourceImpl>();

  @override
  Future<Either<Failure, GenericPagination<PaymentCardEntity>>> getPaymentCards({String? next}) async {
    try {
      final result = await _datasource.getPaymentCards(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> confirmPaymentCards(
      {required int session, required String otp, required String cardNumber}) async {
    try {
      final result = await _datasource.confirmPaymentCards(session: session, cardNumber: cardNumber, otp: otp);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, CreateCardResponseModel>> createPaymentCards(
      {required String cardNumber, required String expireDate}) async {
    try {
      final result = await _datasource.createPaymentCards(cardNumber: cardNumber, expireDate: expireDate);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      final f = ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode);
      return Left(f);
    }
  }

  @override
  Future<Either<Failure, void>> deletePaymentCards(int id) async {
    try {
      final result = await _datasource.deletePaymentCards(id);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
