import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class TopOrganizationUseCase extends UseCase<TopOrganizationEntity, TopOrganizationParams> {
  final VacancyRepository repository;

  TopOrganizationUseCase({required this.repository});

  @override
  Future<Either<Failure, TopOrganizationEntity>> call(TopOrganizationParams params) async =>
      await repository.getTopOrganization();
}

class TopOrganizationParams extends Equatable {
  final String? category;

  const TopOrganizationParams({ this.category});

  @override
  List<Object?> get props => [category];
}
