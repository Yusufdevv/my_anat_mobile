import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class VacancySingleUseCase extends UseCase<VacancyListEntity, VacancySingleParams> {
  final VacancyRepository repository;

  VacancySingleUseCase({required this.repository});

  @override
  Future<Either<Failure, VacancyListEntity>> call(VacancySingleParams params) async =>
      await repository.getSingleVacancy(slug: params.slug);
}

class VacancySingleParams extends Equatable {
  final String slug;

  const VacancySingleParams({required this.slug});

  @override
  List<Object?> get props => [slug];
}
