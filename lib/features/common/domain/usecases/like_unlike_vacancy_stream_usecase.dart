import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/common/domain/repositories/like_unlike_repository.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class LikeUnlikeVacancyStreamUseCase implements StreamUseCase<VacancyListEntity, NoParams> {
  final LikeUnlikeRepository repository;
  LikeUnlikeVacancyStreamUseCase({required this.repository});
  @override
  Stream<VacancyListEntity> call(NoParams params) async* {
    yield* repository.likeUnlikeVacancyStream();
  }
}
