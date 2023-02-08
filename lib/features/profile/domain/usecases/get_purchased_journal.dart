import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/profile/data/models/purchased_journal.dart';

class GetPurchasedJournalUS
    extends UseCase<GenericPagination<PurchasedJournalModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<PurchasedJournalModel>>> call(
      String? params) {
    return repo.fetchMore(
        url: '/journal/purchased/', fromJson: PurchasedJournalModel.fromJson, next: params);
  }
}
