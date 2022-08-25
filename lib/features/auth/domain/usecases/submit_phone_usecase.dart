import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class SubmitPhoneUseCase implements UseCase<String, PhoneParams> {
  final AuthenticationRepository repository;
  SubmitPhoneUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call(PhoneParams params) async =>
      await repository.submitPhone(stateId: params.stateId, phone: params.phone);
}

class PhoneParams extends Equatable {
  final String phone;
  final String stateId;
  const PhoneParams({
    required this.stateId,
    required this.phone,
  });

  @override
  List<Object?> get props => [phone, stateId];
}
