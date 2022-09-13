import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/domain/repositories/like_unlike_repository.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class LikeVacancyUseCase implements UseCase<void, VacancyListEntity> {
  final LikeUnlikeRepository repository;
  LikeVacancyUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(VacancyListEntity params) async => await repository.likeVacancy(params);
}
