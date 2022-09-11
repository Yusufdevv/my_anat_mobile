import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/domain/repositories/like_unlike_repository.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';

class LikeDoctorUseCase implements UseCase<void, CandidateListEntity> {
  final LikeUnlikeRepository repository;
  LikeDoctorUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(CandidateListEntity params) async => await repository.likeDoctor(params);
}
