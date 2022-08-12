import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Stream<AuthenticationStatus> statusStream() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield AuthenticationStatus.authenticated;
  }
}
