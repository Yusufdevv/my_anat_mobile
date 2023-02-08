import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class RelatedCandidateListUseCase extends UseCase<GenericPagination, int> {
  final VacancyRepository repository;

  RelatedCandidateListUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination>> call(int params) async =>
      await repository.getRelatedCandidateList(id: params);
}
