import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';
import 'package:equatable/equatable.dart';

class ChangePasswordUseCase implements UseCase<void, ChangePasswordParams> {
  final ProfileRepository repository;
  ChangePasswordUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(ChangePasswordParams params) async =>
      await repository.changePassword(currentPassword: params.currentPassword, newPassword: params.newPassword);
}

class ChangePasswordParams extends Equatable {
  final String currentPassword;
  final String newPassword;
  const ChangePasswordParams({required this.newPassword, required this.currentPassword});

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
