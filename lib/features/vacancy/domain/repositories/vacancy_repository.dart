import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';

abstract class VacancyRepository {
  Future<Either<Failure, VacancyEntity>> getVacancies({required int next});
  Future<Either<Failure, TopOrganizationEntity>> getTopOrganization();
  Future<Either<Failure, VacancyListEntity>> getSingleVacancy({required String slug});
  Future<Either<Failure, GenericPagination>> getSpecizationList();
  Future<Either<Failure, List<VacancyOptionEntity>>> getVacancyOption();
}
