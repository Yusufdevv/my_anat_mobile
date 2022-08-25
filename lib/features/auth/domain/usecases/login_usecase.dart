import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase implements UseCase<void, LoginParams> {
  final AuthenticationRepository repository;
  LoginUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(LoginParams params) async =>
      repository.login(username: params.username, password: params.password);
}

class LoginParams extends Equatable {
  final String username;
  final String password;
  const LoginParams({
    required this.password,
    required this.username,
  });

  @override
  List<Object> get props => [username, password];
}
