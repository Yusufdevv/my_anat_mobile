import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class SendCodeToPhoneUseCase implements UseCase<String, String>{
  final ProfileRepository repository;
  SendCodeToPhoneUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(String params) async => await repository.sendCodeToPhone(phone: params);

}