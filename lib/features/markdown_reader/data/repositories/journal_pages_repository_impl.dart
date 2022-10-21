import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/markdown_reader/data/datasources/journal_pages_datasource.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/journal_page_entity.dart';
import 'package:anatomica/features/markdown_reader/domain/repositories/journal_pages_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class JournalPagesRepositoryImpl extends JournalPagesRepository {
  final JournalPagesDatasource datasource;
  JournalPagesRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, GenericPagination<JournalPageEntity>>> getJournalPages(
      {required String slug, String? next}) async {
    try {
      final result = await datasource.getPages(slug: slug, next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
