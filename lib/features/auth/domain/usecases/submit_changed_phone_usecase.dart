import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_phone_usecase.dart';

class SubmitChangedPhoneUseCase implements UseCase<String, PhoneParams> {
  final AuthenticationRepository repository;
  SubmitChangedPhoneUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(PhoneParams params) async =>
      await repository.submitChangedPhone(stateId: params.stateId, phone: params.phone);
}
