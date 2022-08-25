import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class GetUserDataUseCase implements UseCase<UserEntity, NoParams> {
  final AuthenticationRepository repository;
  GetUserDataUseCase({required this.repository});
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) => repository.getUserData();
}
