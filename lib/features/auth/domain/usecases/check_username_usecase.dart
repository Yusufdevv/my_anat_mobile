import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class CheckUsernameUseCase implements UseCase<bool, UsernameParams> {
  final AuthenticationRepository repository;
  CheckUsernameUseCase({required this.repository});
  @override
  Future<Either<Failure, bool>> call(UsernameParams params) async =>
      await repository.checkUsername(username: params.username);
}

class UsernameParams extends Equatable {
  final String username;
  const UsernameParams({required this.username});
  @override
  List<Object?> get props => [username];
}
