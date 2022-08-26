import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/reset_password_repository.dart';
import 'package:anatomica/features/auth/domain/usecases/confirm_usecase.dart';

class VerifyResetPasswordCodeUseCase implements UseCase<String, ConfirmationParams> {
  final ResetPasswordRepository repository;
  VerifyResetPasswordCodeUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(ConfirmationParams params) async =>
      await repository.submitCode(stateId: params.stateId, code: params.code);
}
