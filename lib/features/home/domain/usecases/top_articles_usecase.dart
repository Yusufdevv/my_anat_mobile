import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/models/news_model.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class TopArticlesUsecase
    implements UseCase<GenericPagination<JournalArticleModel>, String?> {
  final HomeRepository repository;
  TopArticlesUsecase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalArticleModel>>> call(
          String? params) async =>
      await repository.getHomeArticles(next: params);
}
