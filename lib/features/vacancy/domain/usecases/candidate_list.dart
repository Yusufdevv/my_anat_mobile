import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class CandidateListUseCase extends UseCase<GenericPagination<CandidateListEntity>, NoParams> {
  final VacancyRepository repository;

  CandidateListUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CandidateListEntity>>> call(NoParams params) async =>
      await repository.getCandidateList();
}
