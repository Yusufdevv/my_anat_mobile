import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class DeleteDeviceIdUseCase implements UseCase<void, NoParams> {
  final AuthenticationRepository repository;
  DeleteDeviceIdUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams params) async =>
      repository.deleteDeviceId();
}
