import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/reset_password_repository.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_email_usecase.dart';

class SubmitChangedResetPasswordEmailUseCase implements UseCase<String, EmailParams> {
  final ResetPasswordRepository repository;
  SubmitChangedResetPasswordEmailUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(EmailParams params) async =>
      await repository.submitChangedEmail(stateId: params.stateId, email: params.email);
}
