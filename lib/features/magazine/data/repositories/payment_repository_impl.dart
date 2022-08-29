import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/magazine/data/datasources/payment_datasource.dart';
import 'package:anatomica/features/magazine/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  final PaymentDatasource datasource;

  PaymentRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, String>> orderCreateArticle({
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
  Future<Either<Failure, String>> orderCreateJournal({
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
}
