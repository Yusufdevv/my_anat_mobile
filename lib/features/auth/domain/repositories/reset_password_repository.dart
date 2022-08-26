import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, String>> createResetPasswordNewState();
  Future<Either<Failure, String>> submitCode({required String stateId, required String code});
  Future<Either<Failure, String>> submitPhone({required String stateId, required String phone});
  Future<Either<Failure, String>> submitEmail({required String stateId, required String email});
  Future<Either<Failure, String>> submitChangedPhone({required String stateId, required String phone});
  Future<Either<Failure, String>> submitChangedEmail({required String stateId, required String email});
  Future<Either<Failure, void>> resendCode({required String stateId});
}
