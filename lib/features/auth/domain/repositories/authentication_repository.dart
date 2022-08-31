import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Stream<AuthenticationStatus> statusStream();

  Future<Either<Failure, void>> login(
      {required String username, required String password});

  Future<Either<Failure, UserEntity>> getUserData();

  Future<Either<Failure, bool>> checkUsername({required String username});

  Future<Either<Failure, String>> createNewState();

  Future<Either<Failure, String>> submitNameUsername(
      {required String username,
      required String fullName,
      required String stateId});

  Future<Either<Failure, String>> submitCode(
      {required String stateId, required String code});

  Future<Either<Failure, String>> submitPhone(
      {required String stateId, required String phone});

  Future<Either<Failure, String>> submitEmail(
      {required String stateId, required String email});

  Future<Either<Failure, String>> submitChangedPhone(
      {required String stateId, required String phone});

  Future<Either<Failure, String>> submitChangedEmail(
      {required String stateId, required String email});

  Future<Either<Failure, void>> resendCode({required String stateId});

  Future<Either<Failure, String>> submitPassword(
      {required String stateId,
      required String password,
      required String confirmPassword});

  Future<Either<Failure, void>> submitResetPassword(
      {required String stateId,
      required String password,
      required String confirmPassword});
}
