import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_education.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class CandidateEducationUseCase
    extends UseCase<GenericPagination<CandidateEducationEntity>, int> {
  final VacancyRepository repository;

  CandidateEducationUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CandidateEducationEntity>>> call(
          int params) async =>
      await repository.getCandidateEducation(id: params);
}
