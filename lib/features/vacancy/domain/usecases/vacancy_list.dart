import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class VacancyListUseCase extends UseCase<VacancyEntity, VacancyListParams> {
  final VacancyRepository repository;

  VacancyListUseCase({required this.repository});

  @override
  Future<Either<Failure, VacancyEntity>> call(VacancyListParams params) async =>
      await repository.getVacancies(
        next: params.next,
        organizationId: params.organizationId,
        search: params.search,
        category: params.category,
      );
}

class VacancyListParams extends Equatable {
  final String? next;
  final String? search;
  final int? organizationId;
  final String? category;

  const VacancyListParams({
    this.category,
    this.organizationId,
    this.search,
    this.next,
  });

  @override
  List<Object?> get props => [
        next,
        search,
        organizationId,
        category,
      ];
}
