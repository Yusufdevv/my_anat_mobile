import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/profile/domain/repositories/profile.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class GetLikedVacanciesUseCase implements UseCase<GenericPagination<VacancyListEntity>, String?> {
  final ProfileRepository repository;
  GetLikedVacanciesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<VacancyListEntity>>> call(String? params) async =>
      await repository.getLikedVacancy(next: params);
}
