import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_outline_entity.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_page_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class JournalPagesRepository {
  Future<Either<Failure, GenericPagination<JournalPageEntity>>> getJournalPages({required String slug, String? next});
  Future<Either<Failure, GenericPagination<JournalOutlineEntity>>> getPagesTableOfContents({required String slug, String? next});
}
