import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class TopOrganizationUseCase extends UseCase<TopOrganizationEntity, NoParams> {
  final VacancyRepository repository;

  TopOrganizationUseCase({required this.repository});

  @override
  Future<Either<Failure, TopOrganizationEntity>> call(NoParams params) async =>
      await repository.getTopOrganization();
}
