import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';

abstract class AuthenticationRepository {
  Stream<AuthenticationStatus> statusStream();
}
