import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class VacancyFilterUseCase extends UseCase<List<VacancyOptionEntity>, NoParams> {
  final VacancyRepository repository;

  VacancyFilterUseCase({required this.repository});

  @override
  Future<Either<Failure, List<VacancyOptionEntity>>> call(NoParams params) async =>
      await repository.getVacancyFilter();
}
