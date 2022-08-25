import 'dart:async';

import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/data/datasources/authentication_data_source.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource dataSource;
  AuthenticationRepositoryImpl({required this.dataSource});
  final StreamController<AuthenticationStatus> _statusController = StreamController.broadcast(sync: true);
  @override
  Stream<AuthenticationStatus> statusStream() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield AuthenticationStatus.unauthenticated;
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
}
