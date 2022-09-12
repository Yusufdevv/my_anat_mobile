import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';

class GetLikedCandidatesUseCase implements UseCase<GenericPagination<CandidateListEntity>, String?> {
  final ProfileRepository repository;
  GetLikedCandidatesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<CandidateListEntity>>> call(String? params) async =>
      await repository.getLikedCandidate(next: params);
}
