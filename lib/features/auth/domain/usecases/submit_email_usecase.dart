import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SubmitEmailUseCase implements UseCase<String, EmailParams> {
  final AuthenticationRepository repository;
  SubmitEmailUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(EmailParams params) async =>
      await repository.submitEmail(stateId: params.stateId, email: params.email);
}

class EmailParams extends Equatable {
  final String email;
  final String stateId;
  const EmailParams({required this.stateId, required this.email});

  @override
  List<Object?> get props => [email, stateId];
}
