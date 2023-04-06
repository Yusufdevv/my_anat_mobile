import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/data/models/doctor_interview_model.dart';
import 'package:anatomica/features/home/data/models/category_model.dart';
import 'package:anatomica/features/home/data/models/news_model.dart';
import 'package:anatomica/features/hospital_single/data/models/comment_model.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class HomeRepository {
  Future<Either<Failure, GenericPagination<CategoryModel>>> getCategories(
      {String? next});

  Future<Either<Failure, GenericPagination<JournalArticleModel>>>
      getHomeArticles({String? next});

  Future<Either<Failure, GenericPagination<DoctorInterviewModel>>>
      getPopularDoctors({String? next});

  Future<Either<Failure, GenericPagination<CommentModel>>> getPopularOrgs(
      {String? next});

  Future<Either<Failure, GenericPagination<NewsModel>>> getNews({String? next});

  Future<Either<Failure, NewsModel>> getNewSingle({required String slug});
}
