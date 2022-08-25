import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class CreateNewStateUseCase implements UseCase<String, NoParams> {
  final AuthenticationRepository repository;
  CreateNewStateUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(NoParams params) async => await repository.createNewState();
}
