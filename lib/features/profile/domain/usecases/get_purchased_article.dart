import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/profile/data/models/purchased_article.dart';

class GetPurchasedArticleUS
    extends UseCase<GenericPagination<PurchasedArticleModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<PurchasedArticleModel>>> call(
      String? params) {
    return repo.fetchMore(
        url: '/article/purchased/', fromJson: PurchasedArticleModel.fromJson, next: params);
  }
}
