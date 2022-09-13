import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class DeleteAccountUseCase implements UseCase<void, NoParams> {
  final ProfileRepository repository;
  DeleteAccountUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(NoParams params) async => await repository.deleteAccount();
}
