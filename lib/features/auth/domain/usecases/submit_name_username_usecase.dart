import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SubmitNameUserNameUseCase implements UseCase<String, NameUsernameParams> {
  final AuthenticationRepository repository;
  SubmitNameUserNameUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(NameUsernameParams params) async =>
      await repository.submitNameUsername(username: params.username, fullName: params.name, stateId: params.stateId);
}

class NameUsernameParams extends Equatable {
  final String name;
  final String username;
  final String stateId;
  const NameUsernameParams({required this.stateId, required this.username, required this.name});

  @override
  List<Object?> get props => [name, username, stateId];
}
