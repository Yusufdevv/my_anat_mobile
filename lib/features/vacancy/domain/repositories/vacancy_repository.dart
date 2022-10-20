import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/data/models/category_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/entities/certificate.dart';
import 'package:anatomica/features/vacancy/domain/entities/district.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_list.dart';

abstract class VacancyRepository {
  Future<Either<Failure, VacancyEntity>> getVacancies({String? next, VacancyParamsEntity? vacancyParamsEntity});

  Future<Either<Failure, TopOrganizationEntity>> getTopOrganization();

  Future<Either<Failure, VacancyListEntity>> getSingleVacancy({required String slug});

  Future<Either<Failure, GenericPagination>> getSpecizationList();

  Future<Either<Failure, List<VacancyOptionEntity>>> getVacancyOption();

  Future<Either<Failure, GenericPagination<VacancyListEntity>>> getRelationVacancyList({required String slug});

  Future<Either<Failure, GenericPagination<CandidateListEntity>>> getCandidateList(
      {String? next, String? search, List<int>? categoryId, CandidateListParams? params});

  Future<Either<Failure, CandidateSingleEntity>> getCandidateSingle({required int id});

  Future<Either<Failure, GenericPagination<RegionEntity>>> getRegion({String? next});

  Future<Either<Failure, GenericPagination<DistrictEntity>>> getDistrictList({String? next, int? id});

  Future<Either<Failure, GenericPagination<CategoryListModel>>> getCategoryList({String? next});

  Future<Either<Failure, List<VacancyOptionEntity>>> getVacancyFilter();

  Future<Either<Failure, GenericPagination<CertificateEntity>>> getCandidateCertificate({required int id});

  Future<Either<Failure, GenericPagination<CandidateEducationEntity>>> getCandidateEducation({required int id});

  Future<Either<Failure, GenericPagination<CandidateWorkEntity>>> getCandidateWork({required int id});

  Future<Either<Failure, GenericPagination<CandidateListEntity>>> getRelatedCandidateList({required int id});
}
