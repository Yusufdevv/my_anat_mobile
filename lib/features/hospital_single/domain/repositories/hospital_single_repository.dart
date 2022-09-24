import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/post_comment_entity.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

abstract class HospitalSingleRepository {
  Future<Either<Failure, HospitalSingleEntity>> getHospitalSingle({required String slug});

  Future<Either<Failure, GenericPagination<HospitalServiceEntity>>> getHospitalServices(
      {required int id, String? next, String search = ''});

  Future<Either<Failure, GenericPagination<HospitalDoctorsEntity>>> getHospitalSpecialists(
      {required int id, String? next});

  Future<Either<Failure, GenericPagination<ComfortEntity>>> getHospitalConditions(
      {required int id, String? next});

  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> getHospitalArticles(
      {required int id, String? next});

  Future<Either<Failure, GenericPagination<CommentEntity>>> getHospitalComments(
      {required int id, String? next});

  Future<Either<Failure, GenericPagination<VacancyListEntity>>> getHospitalVacancies(
      {required int id, String? next});

  Future<Either<Failure, void>> postComment(
      {required int organizationId, required PostCommentEntity comment});

  Future<Either<Failure, Either>> deleteComment({required int id});
}
