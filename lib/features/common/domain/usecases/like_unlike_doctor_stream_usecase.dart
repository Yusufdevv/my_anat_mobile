import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/common/domain/repositories/like_unlike_repository.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate.dart';

class LikeUnlikeDoctorStreamUseCase implements StreamUseCase<CandidateListEntity, NoParams> {
  final LikeUnlikeRepository repository;
  LikeUnlikeDoctorStreamUseCase({required this.repository});
  @override
  Stream<CandidateListEntity> call(NoParams params) async* {
    yield* repository.likeUnlikeDoctorStream();
  }
}
