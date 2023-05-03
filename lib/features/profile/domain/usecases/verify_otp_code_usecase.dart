import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class VerifyOtpCodeUsecase implements UseCase<void, VerifyOtpCodeParams> {
  final ProfileRepository repository;
  VerifyOtpCodeUsecase({required this.repository});
  @override
  Future<Either<Failure, void>> call(VerifyOtpCodeParams params) async =>
      await repository.verifyOtpCode(
        type: params.type,
        signature: params.signature,
        code: params.code,
        email: params.email,
        phone: params.phone,
      );
}

class VerifyOtpCodeParams {
  final String type;
  final String signature;
  final String code;
  final String? phone;
  final String? email;
  const VerifyOtpCodeParams({
    required this.type,
    required this.signature,
    required this.code,
    this.phone,
    this.email,
  });
}
