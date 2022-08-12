import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';

class GetAuthenticationStatusUseCase implements StreamUseCase<AuthenticationStatus, NoParams> {
  final AuthenticationRepository repository;
  GetAuthenticationStatusUseCase({required this.repository});
  @override
  Stream<AuthenticationStatus> call(NoParams params) => repository.statusStream();
}
