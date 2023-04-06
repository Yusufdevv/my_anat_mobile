import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/data/models/doctor_interview_model.dart';
import 'package:anatomica/features/home/data/datasources/home_datasource.dart';
import 'package:anatomica/features/home/data/models/category_model.dart';
import 'package:anatomica/features/home/data/models/news_model.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/hospital_single/data/models/comment_model.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class HomeRepoImpl extends HomeRepository {
  final HomeDatasource datasource;

  HomeRepoImpl({required this.datasource});

  @override
  Future<Either<Failure, GenericPagination<CategoryModel>>> getCategories(
      {String? next}) async {
    try {
      final result = await datasource.getCategories(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<JournalArticleModel>>>
      getHomeArticles({String? next}) async {
    try {
      final result = await datasource.getHomeArticles(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<DoctorInterviewModel>>>
      getPopularDoctors({String? next}) async {
    try {
      final result = await datasource.getPopularDoctors(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<CommentModel>>> getPopularOrgs(
      {String? next}) async {
    try {
      final result = await datasource.getPopularOrgs(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<NewsModel>>> getNews(
      {String? next}) async {
    try {
      final result = await datasource.getNews(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }

  @override
  Future<Either<Failure, NewsModel>> getNewSingle(
      {required String slug}) async {
    try {
      final result = await datasource.getNewSingle(slug: slug);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
