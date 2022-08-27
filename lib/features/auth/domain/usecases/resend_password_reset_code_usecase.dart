import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/reset_password_repository.dart';

class ResendPasswordResetCodeUseCase implements UseCase<void, String> {
  final ResetPasswordRepository repository;
  ResendPasswordResetCodeUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(String params) => repository.resendCode(stateId: params);
}
