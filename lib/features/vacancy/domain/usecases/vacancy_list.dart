import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class VacancyListUseCase extends UseCase<VacancyEntity, String> {
  final VacancyRepository repository;

  VacancyListUseCase({required this.repository});

  @override
  Future<Either<Failure, VacancyEntity>> call(String? next) async =>
      await repository.getVacancies(next:next);
}


