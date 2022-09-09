import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class OrganizationVacancyUseCase extends UseCase<VacancyEntity, OrganizationVacancyParams> {
  final VacancyRepository repository;

  OrganizationVacancyUseCase({required this.repository});

  @override
  Future<Either<Failure, VacancyEntity>> call(OrganizationVacancyParams params) async =>
      await repository.getVacancies(
          next: params.next, vacancyParamsEntity: params.vacancyParamsEntity);
}

class OrganizationVacancyParams extends Equatable {
  final String? next;
  final VacancyParamsEntity? vacancyParamsEntity;

  const OrganizationVacancyParams({this.vacancyParamsEntity, this.next});

  @override
  List<Object?> get props => [
        vacancyParamsEntity,
        next,
      ];
}
