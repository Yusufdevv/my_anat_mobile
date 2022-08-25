import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SubmitPasswordUseCase implements UseCase<String, PasswordParams> {
  final AuthenticationRepository repository;
  SubmitPasswordUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(PasswordParams params) async => repository.submitPassword(
      stateId: params.stateId, password: params.password, confirmPassword: params.confirmPassword);
}

class PasswordParams extends Equatable {
  final String password;
  final String confirmPassword;
  final String stateId;
  const PasswordParams({
    required this.stateId,
    required this.confirmPassword,
    required this.password,
  });

  @override
  List<Object?> get props => [password, confirmPassword, stateId];
}
