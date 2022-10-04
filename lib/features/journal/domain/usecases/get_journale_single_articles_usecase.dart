import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/journal/domain/repositories/journal_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:equatable/equatable.dart';

class GetJournalSingleArticlesUseCase
    implements UseCase<GenericPagination<JournalArticleEntity>, JournalSingleArticleParams> {
  final JournalRepository repository;
  GetJournalSingleArticlesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> call(JournalSingleArticleParams params) async =>
      await repository.getJournalSingleArticles(id: params.id, next: params.next);
}

class JournalSingleArticleParams extends Equatable {
  final int id;
  final String? next;
  const JournalSingleArticleParams({required this.id, this.next});
  @override
  List<Object?> get props => [id, next];
}
