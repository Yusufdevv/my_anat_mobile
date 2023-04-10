import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/data/models/doctor_interview_model.dart';
import 'package:anatomica/features/home/data/models/banner_model.dart';
import 'package:anatomica/features/home/data/models/category_model.dart';
import 'package:anatomica/features/home/data/models/news_model.dart';
import 'package:anatomica/features/hospital_single/data/models/comment_model.dart';
import 'package:anatomica/features/journal/data/models/journal_article_model.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class HomeRepository {
  Future<Either<Failure, GenericPagination<CategoryModel>>> getCategories(
      {String? next});

  Future<Either<Failure, GenericPagination<JournalArticleModel>>>
      getHomeArticles({String? next});

  Future<Either<Failure, GenericPagination<HospitalDoctorsModel>>>
      getPopularDoctors({String? next});

  Future<Either<Failure, GenericPagination<OrgMapV2Model>>> getPopularOrgs(
      {String? next});

  Future<Either<Failure, GenericPagination<BannerModel>>> getBanners(
      {String? next});

  Future<Either<Failure, GenericPagination<NewsModel>>> getNews({String? next});

  Future<Either<Failure, NewsModel>> getNewSingle({required String slug});
}
