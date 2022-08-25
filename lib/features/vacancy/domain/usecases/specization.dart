import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class SpecizationUseCase extends UseCase<GenericPagination, NoParams> {
  final VacancyRepository repository;

  SpecizationUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination>> call(NoParams params) async =>
      await repository.getSpecizationList();
}
