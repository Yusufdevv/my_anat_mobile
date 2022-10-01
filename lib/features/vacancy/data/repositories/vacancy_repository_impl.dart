import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/data/datasources/vacancy_remote_datasource.dart';
import 'package:anatomica/features/vacancy/data/models/category_list.dart';
import 'package:anatomica/features/vacancy/data/models/district.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/entities/certificate.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';

class VacancyRepositoryImpl extends VacancyRepository {
  final VacancyRemoteDataSource dataSource;

  VacancyRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, VacancyEntity>> getVacancies({
    String? next,
    VacancyParamsEntity? vacancyParamsEntity,
  }) async {
    try {
      final result = await dataSource.getVacancyList(next: next, vacancyParamsEntity: vacancyParamsEntity);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(statusCode: 141, errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, TopOrganizationEntity>> getTopOrganization() async {
    try {
      final result = await dataSource.getTopOrganization();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(statusCode: error.statusCode.toInt(), errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, VacancyListEntity>> getSingleVacancy({required String slug}) async {
    try {
      final result = await dataSource.getSingleVacancy(slug: slug);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(statusCode: error.statusCode.toInt(), errorMessage: error.errorMessage));
    }
  }

  @override
  Future<Either<Failure, GenericPagination>> getSpecizationList() async {
    try {
      final result = await dataSource.getSpecizationList();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, List<VacancyOptionEntity>>> getVacancyOption() async {
    try {
      final result = await dataSource.getVacancyOption();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<VacancyListEntity>>> getRelationVacancyList({required String slug}) async {
    try {
      final result = await dataSource.getRelatedVacancyList(slug: slug);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<CandidateListEntity>>> getCandidateList(
      {String? next, String? search, String? categoryId, CandidateListParams? params}) async {
    try {
      final result =
          await dataSource.getCandidateList(next: next, search: search, categoryId: categoryId, params: params);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, CandidateSingleEntity>> getCandidateSingle({required int id}) async {
    try {
      final result = await dataSource.getCandidateSingle(id: id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<DistrictModel>>> getDistrictList({String? next, int? id}) async {
    try {
      final result = await dataSource.getDistrict(id: id, next: next);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<RegionEntity>>> getRegion({String? next}) async {
    try {
      final result = await dataSource.getRegion(next: next);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<CategoryListModel>>> getCategoryList({String? next}) async {
    try {
      final result = await dataSource.getCategoryList();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, List<VacancyOptionEntity>>> getVacancyFilter() async {
    try {
      final result = await dataSource.getVacancyFilter();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<CertificateEntity>>> getCandidateCertificate({required int id}) async {
    try {
      final result = await dataSource.getCandidateCertificate(id: id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<CandidateEducationEntity>>> getCandidateEducation({required int id}) async {
    try {
      final result = await dataSource.getCandidateEducation(id: id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<CandidateWorkEntity>>> getCandidateWork({required int id}) async {
    try {
      final result = await dataSource.getCandidateWork(id: id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<CandidateListEntity>>> getRelatedCandidateList({required int id}) async {
    try {
      final result = await dataSource.getRelatedCandidateList(id: id);
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(errorMessage: error.errorMessage, statusCode: 141));
    }
  }
}
