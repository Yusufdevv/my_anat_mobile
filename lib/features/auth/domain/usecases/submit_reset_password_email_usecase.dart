import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/reset_password_repository.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_email_usecase.dart';

class SubmitResetPasswordEmailUseCase implements UseCase<String, EmailParams> {
  final ResetPasswordRepository repository;
  SubmitResetPasswordEmailUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(EmailParams params) async =>
      await repository.submitEmail(stateId: params.stateId, email: params.email);
}
