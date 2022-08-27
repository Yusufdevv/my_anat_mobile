import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/reset_password_repository.dart';

class CreateResetPasswordNewStateUseCase implements UseCase<String, NoParams> {
  final ResetPasswordRepository repository;
  CreateResetPasswordNewStateUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(NoParams params) async => await repository.createResetPasswordNewState();
}
