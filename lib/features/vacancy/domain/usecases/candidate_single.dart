import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class CandidateSingleUseCase extends UseCase<CandidateSingleEntity, CandidateSingleParams> {
  final VacancyRepository repository;

  CandidateSingleUseCase({required this.repository});

  @override
  Future<Either<Failure, CandidateSingleEntity>> call(CandidateSingleParams params) async =>
      await repository.getCandidateSingle(id: params.id);
}

class CandidateSingleParams extends Equatable {
  final int id;

  const CandidateSingleParams({required this.id});

  @override
  List<Object?> get props => [id];
}
