import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/data/models/payment_history_model.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';

class MyPaymentsUsecase
    implements
        UseCase<GenericPagination<PaymentHistoryModel>, MyPaymentsParams> {
  final ProfileRepository repository;

  MyPaymentsUsecase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<PaymentHistoryModel>>> call(
          MyPaymentsParams params) async =>
      await repository.getMyPayments(
          next: params.next,
          search: params.search,
          provider: params.provider,
          purpose: params.purpose,
          status: params.status);
}

class MyPaymentsParams {
  final String? next;
  final String? search;
  final String? provider;
  final String? purpose;
  final String? status;

  const MyPaymentsParams(
      {this.status, this.purpose, this.provider, this.search, this.next});
}
