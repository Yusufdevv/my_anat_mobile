import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_interview_entity.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class DoctorSingleRepository {
  Future<Either<Failure, DoctorSingleEntity>> getDoctorSingle({required int id});
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> getDoctorArticles({required int id, String? next});
  Future<Either<Failure, GenericPagination<CommentEntity>>> getDoctorComments({required int id, String? next});
  Future<Either<Failure, GenericPagination<DoctorInterviewEntity>>> getDoctorInterviews(
      {required int id, String? next});
}
