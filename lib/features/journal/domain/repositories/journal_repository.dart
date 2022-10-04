import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/journal/data/models/journal_article_single_model.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/journal/domain/entities/journal_entity.dart';
import 'package:anatomica/features/journal/domain/entities/journal_single_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class JournalRepository {
  Future<Either<Failure, GenericPagination<JournalEntity>>> getJournals({String? next});
  Future<Either<Failure, GenericPagination<JournalEntity>>> searchJournals({required String query, String? next});
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> getJournalArticles({String? next, String query});
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> getJournalSingleArticles(
      {required int id, String? next});
  Future<Either<Failure, JournalArticleSingleModel>> getJournalArticleSingle({required String slug});
  Future<Either<Failure, JournalSingleEntity>> getJournalSingle({required String slug});
}
