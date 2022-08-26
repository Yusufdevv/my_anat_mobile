import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/data/datasources/reset_password_datasource.dart';
import 'package:anatomica/features/auth/domain/repositories/reset_password_repository.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  final ResetPasswordDatasource datasource;
  ResetPasswordRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, String>> createResetPasswordNewState() async {
    try {
      final result = await datasource.createResetPasswordNewState();
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
  Future<Either<Failure, void>> resendCode({required String stateId}) async {
    try {
      final result = await datasource.resendCode(stateId: stateId);
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
  Future<Either<Failure, String>> submitChangedEmail({required String stateId, required String email}) async {
    try {
      final result = await datasource.submitChangedEmail(email: email, stateId: stateId);
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
  Future<Either<Failure, String>> submitChangedPhone({required String stateId, required String phone}) async {
    try {
      final result = await datasource.submitChangedPhone(phone: phone, stateId: stateId);
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
  Future<Either<Failure, String>> submitCode({required String stateId, required String code}) async {
    try {
      final result = await datasource.verifyPhone(code: code, stateId: stateId);
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
  Future<Either<Failure, String>> submitEmail({required String stateId, required String email}) async {
    try {
      final result = await datasource.submitEmail(email: email, stateId: stateId);
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
  Future<Either<Failure, String>> submitPhone({required String stateId, required String phone}) async {
    try {
      final result = await datasource.submitPhone(phone: phone, stateId: stateId);
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
