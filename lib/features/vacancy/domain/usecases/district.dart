import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/district.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class DistrictUseCase extends UseCase<GenericPagination<DistrictEntity>, NoParams> {
  final VacancyRepository repository;

  DistrictUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<DistrictEntity>>> call(NoParams params) async =>
      await repository.getDistrictList();
}
