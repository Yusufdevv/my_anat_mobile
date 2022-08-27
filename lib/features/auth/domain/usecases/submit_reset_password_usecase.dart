import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_password_usecase.dart';

class SubmitResetPasswordUseCase implements UseCase<void, PasswordParams> {
  final AuthenticationRepository repository;
  SubmitResetPasswordUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(PasswordParams params) async => repository.submitResetPassword(
      stateId: params.stateId, password: params.password, confirmPassword: params.confirmPassword);
}
