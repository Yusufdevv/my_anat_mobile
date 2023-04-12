import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/datasources/hospital_single_datasource.dart';
import 'package:anatomica/features/hospital_single/data/models/post_comment_model.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_single.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_special_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/post_comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class HospitalSingleRepositoryImpl extends HospitalSingleRepository {
  final HospitalSingleDatasource datasource;

  HospitalSingleRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, HospitalSingleEntity>> getHospitalSingle(
      {required String slug}) async {
    try {
      final result = await datasource.getHospitalSingle(slug: slug);
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
  Future<Either<Failure, GenericPagination<HospitalServiceEntity>>>
      getHospitalServicesOrg(
          {required int orgId, required int specId, String? next, String search = ''}) async {
    try {
      final result = await datasource.getHospitalServicesOrg(
          orgId: orgId, next: next, search: search, specId: specId);
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
  Future<Either<Failure, GenericPagination<HospitalServiceSpecialEntity>>>
      getHospitalServicesSpecial(
          {required int orgId, String? next, String search = ''}) async {
    try {
      final result = await datasource.getHospitalServicesSpecial(
          orgId: orgId, next: next, search: search,);
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
  Future<Either<Failure, GenericPagination<HospitalDoctorsEntity>>>
      getHospitalSpecialistsDoctors({required int id, String? next}) async {
    try {
      final result =
          await datasource.getHospitalSpecialistsDoctors(id: id, next: next);
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
  Future<Either<Failure, GenericPagination<ComfortEntity>>>
      getHospitalConditions({required int id, String? next}) async {
    try {
      final result = await datasource.getHospitalConditions(id: id, next: next);
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
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>>
      getHospitalArticles({required int id, String? next}) async {
    try {
      final result = await datasource.getHospitalArticles(id: id, next: next);
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
  Future<Either<Failure, GenericPagination<CommentEntity>>> getHospitalComments(
      {required int id, String? next}) async {
    try {
      final result = await datasource.getHospitalComments(id: id, next: next);
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
  Future<Either<Failure, GenericPagination<VacancyListEntity>>>
      getHospitalVacancies({required int id, String? next}) async {
    try {
      final result = await datasource.getHospitalVacancies(id: id, next: next);
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
  Future<Either<Failure, void>> postComment(
      {required int organizationId, required PostCommentEntity comment}) async {
    try {
      await datasource.postComment(
          organizationId: organizationId,
          comment: PostCommentModel(
              rating: comment.rating, comment: comment.comment));
      return Right('');
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
  Future<Either<Failure, Either>> deleteComment({required int id}) async {
    try {
      await datasource.deleteComment(id: id);
      return Right(Right(''));
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
  Future<Either<Failure, HospitalServiceSingleEntity>> getServiceSingle(
      {required int id}) async {
    try {
      final result = await datasource.getSingleService(id: id);
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
