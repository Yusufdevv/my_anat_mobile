import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';

class RemoveWishListVacancyUseCase extends UseCase<Either, int> {
  final VacancyRepository repository;

  RemoveWishListVacancyUseCase({required this.repository});

  @override
  Future<Either<Failure, Either>> call(int id) async =>
      await repository.removeWishListVacancy(id: id);
}
