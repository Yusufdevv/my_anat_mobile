import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/magazine/data/datasources/journal_datasource.dart';
import 'package:anatomica/features/magazine/data/models/journal_article_single_model.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/magazine/domain/entities/journal_entity.dart';
import 'package:anatomica/features/magazine/domain/repositories/journal_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class JournalRepositoryImpl extends JournalRepository {
  final JournalDatasource datasource;
  JournalRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, GenericPagination<JournalEntity>>> getJournals({String? next}) async {
    try {
      final result = await datasource.getJournals(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<JournalEntity>>> searchJournals(
      {required String query, String? next}) async {
    try {
      final result = await datasource.searchJournals(query: query, next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> getJournalArticles({String? next}) async {
    try {
      final result = await datasource.getJournalArticles(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, JournalArticleSingleModel>> getJournalArticleSingle({required String slug}) async {
    try {
      final result = await datasource.getJournalArticleSingle(slug: slug);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> getJournalSingleArticles(
      {required int id, String? next}) async {
    try {
      final result = await datasource.getJournalSingleArticles(id: id, next: next);
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
