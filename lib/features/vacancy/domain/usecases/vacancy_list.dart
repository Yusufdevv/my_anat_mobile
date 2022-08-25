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
      await repository.getVacancies(next: params.next);
}

class VacancyListParams extends Equatable {
  final int next;

  const VacancyListParams({required this.next});

  @override
  List<Object?> get props => [];
}
