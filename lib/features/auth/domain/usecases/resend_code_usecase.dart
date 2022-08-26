import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class ResendCodeUseCase implements UseCase<void, String> {
  final AuthenticationRepository repository;
  ResendCodeUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(String params) => repository.resendCode(stateId: params);
}
