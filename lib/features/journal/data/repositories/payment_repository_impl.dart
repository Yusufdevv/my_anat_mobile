import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/data/datasources/payment_datasource.dart';
import 'package:anatomica/features/journal/domain/entities/payment_response_entity.dart';
import 'package:anatomica/features/journal/domain/entities/prices_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentDatasource datasource;

  PaymentRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, PaymentResponseEntity>> orderCreateArticle({
    required int articleId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  }) async {
    try {
      final result = await datasource.orderCreateArticle(
        email: email,
        articleId: articleId,
        paymentProvider: paymentProvider,
        phoneNumber: phoneNumber,
        price: price,
        isRegistered: isRegistered,
      );
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
  Future<Either<Failure, PaymentResponseEntity>> orderCreateJournal({
    required int journalId,
    required int price,
    required String phoneNumber,
    required String email,
    required String paymentProvider,
    required bool isRegistered,
  }) async {
    try {
      final result = await datasource.orderCreateJournal(
          email: email,
          journalId: journalId,
          paymentProvider: paymentProvider,
          phoneNumber: phoneNumber,
          price: price,
          isRegistered: isRegistered);
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
  Future<Either<Failure, String>> checkPaymentStatus({required int id}) async {
    try {
      final result = await datasource.checkPaymentStatus(id: id);
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
  Future<Either<Failure, PricesEntity>> getPrices() async {
    try {
      final result = await datasource.getPrices();
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
  Future<Either<Failure, PaymentResponseEntity>> payForMonthlySubscription(
      {required int numOfMoths, required String paymentProvider}) async {
    try {
      final result =
          await datasource.payForMonthlySubscription(numOfMoths: numOfMoths, paymentProvider: paymentProvider);
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
