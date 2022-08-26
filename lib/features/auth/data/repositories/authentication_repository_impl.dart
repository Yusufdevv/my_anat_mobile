import 'dart:async';

import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/data/datasources/authentication_data_source.dart';
import 'package:anatomica/features/auth/data/datasources/reset_password_datasource.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource dataSource;
  final ResetPasswordDatasource resetPasswordDatasource;
  AuthenticationRepositoryImpl({
    required this.dataSource,
    required this.resetPasswordDatasource,
  });
  final StreamController<AuthenticationStatus> _statusController = StreamController.broadcast(sync: true);
  @override
  Stream<AuthenticationStatus> statusStream() async* {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await getUserData();
      yield AuthenticationStatus.authenticated;
    } on Exception {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _statusController.stream;
  }

  @override
  Future<Either<Failure, void>> login({required String username, required String password}) async {
    try {
      final result = await dataSource.login(username: username, password: password);
      _statusController.add(AuthenticationStatus.authenticated);
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
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final result = await dataSource.getUserData();
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
  Future<Either<Failure, bool>> checkUsername({required String username}) async {
    try {
      final result = await dataSource.checkUserName(username: username);
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
  Future<Either<Failure, String>> createNewState() async {
    try {
      final result = await dataSource.createNewState();
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
      final result = await dataSource.confirmCode(stateId: stateId, code: code);
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
      final result = await dataSource.submitEmail(stateId: stateId, email: email);
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
  Future<Either<Failure, String>> submitNameUsername(
      {required String username, required String fullName, required String stateId}) async {
    try {
      final result = await dataSource.submitNameUsername(username: username, fullName: fullName, stateId: stateId);
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
  Future<Either<Failure, String>> submitPassword(
      {required String stateId, required String password, required String confirmPassword}) async {
    try {
      final result =
          await dataSource.submitPassword(password: password, confirmPassword: confirmPassword, stateId: stateId);
      _statusController.add(AuthenticationStatus.authenticated);
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
      final result = await dataSource.submitPhone(phone: phone, stateId: stateId);
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
      final result = await dataSource.resendCode(stateId: stateId);
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
      final result = await dataSource.submitChangedEmail(stateId: stateId, email: email);
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
      final result = await dataSource.submitChangedPhone(stateId: stateId, phone: phone);
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
  Future<Either<Failure, void>> submitResetPassword(
      {required String stateId, required String password, required String confirmPassword}) async {
    try {
      final result = await resetPasswordDatasource.submitPassword(
          password: password, confirmPassword: confirmPassword, stateId: stateId);
      _statusController.add(AuthenticationStatus.authenticated);
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
