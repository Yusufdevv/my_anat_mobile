import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class ConfirmUseCase implements UseCase<String, ConfirmationParams> {
  final AuthenticationRepository repository;
  ConfirmUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(ConfirmationParams params) async =>
      repository.submitCode(stateId: params.stateId, code: params.code);
}

class ConfirmationParams extends Equatable {
  final String code;
  final String stateId;
  const ConfirmationParams({required this.stateId, required this.code});

  @override
  List<Object?> get props => [
        code,
        stateId,
      ];
}
