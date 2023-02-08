import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_work.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class CandidateWorkUseCase extends UseCase<GenericPagination<CandidateWorkEntity>, int> {
  final VacancyRepository repository;

  CandidateWorkUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CandidateWorkEntity>>> call(int params) async =>
      await repository.getCandidateWork(id: params);
}
