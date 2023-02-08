import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_education_files_entity.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class CandidateEducationFilesUseCase
    extends UseCase<GenericPagination<CandidateEducationFilesEntity>, int> {
  final VacancyRepository repository;

  CandidateEducationFilesUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CandidateEducationFilesEntity>>>
      call(int params) async =>
          await repository.getCandidateEducationFiles(id: params);
}
