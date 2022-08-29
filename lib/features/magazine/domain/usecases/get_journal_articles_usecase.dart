import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/magazine/domain/repositories/journal_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetJournalArticlesUseCase implements UseCase<GenericPagination<JournalArticleEntity>, String?> {
  final JournalRepository repository;
  GetJournalArticlesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> call(String? params) async =>
      await repository.getJournalArticles(next: params);
}
