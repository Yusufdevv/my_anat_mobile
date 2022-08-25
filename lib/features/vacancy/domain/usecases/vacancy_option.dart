import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_option.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class VacancyOptionUseCase extends UseCase<List<VacancyOptionEntity>, NoParams> {
  final VacancyRepository repository;

  VacancyOptionUseCase({required this.repository});

  @override
  Future<Either<Failure, List<VacancyOptionEntity>>> call(NoParams params) async =>
      await repository.getVacancyOption();
}
