import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/data/datasources/doctor_single_datasource.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_comment.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_interview_entity.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/doctor_single/domain/repositories/doctor_single_repository.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class DoctorSingleRepositoryImpl extends DoctorSingleRepository {
  final DoctorSingleDatasource datasource;

  DoctorSingleRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, DoctorSingleEntity>> getDoctorSingle({required int id}) async {
    try {
      final result = await datasource.getDoctorSingle(id: id);
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
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> getDoctorArticles(
      {required int id, String? next}) async {
    try {
      final result = await datasource.getDoctorArticles(id: id, next: next);
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
  Future<Either<Failure, GenericPagination<DoctorInterviewEntity>>> getDoctorInterviews(
      {required int id, String? next}) async {
    try {
      final result = await datasource.getDoctorInterviews(id: id, next: next);
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
  Future<Either<Failure, GenericPagination<CommentEntity>>> getDoctorComments({required int id, String? next}) async {
    try {
      final result = await datasource.getDoctorComments(id: id, next: next);
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
  Future<Either<Failure, DoctorCommentEntity>> sendDoctorComment(
      {required int doctor, required double rating, required String comment}) async {
    try {
      final result = await datasource.sendDoctorComment(
        comment: comment,
        doctor: doctor,
        rating: rating,
      );
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
  Future<Either<Failure, String>> deleteDoctorComment({required int id}) async {
    try {
      final result = await datasource.deleteDoctorComment(id: id);
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
