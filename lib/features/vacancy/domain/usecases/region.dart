import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class RegionUseCase extends UseCase<GenericPagination<RegionEntity>, NoParams> {
  final VacancyRepository repository;

  RegionUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<RegionEntity>>> call(NoParams params) async =>
      await repository.getRegion();
}
