import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/reset_password_repository.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_phone_usecase.dart';

class SubmitResetPasswordPhoneUseCase implements UseCase<String, PhoneParams> {
  final ResetPasswordRepository repository;
  SubmitResetPasswordPhoneUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(PhoneParams params) async =>
      await repository.submitPhone(stateId: params.stateId, phone: params.phone);
}
