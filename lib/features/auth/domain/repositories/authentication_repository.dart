import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Stream<AuthenticationStatus> statusStream();
  Future<Either<Failure, void>> login({required String username, required String password});
  Future<Either<Failure, UserEntity>> getUserData();
}
