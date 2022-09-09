import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class AddWishListVacancyUseCase extends UseCase<Either, AddWishListVacancyParams> {
  final VacancyRepository repository;

  AddWishListVacancyUseCase({required this.repository});

  @override
  Future<Either<Failure, Either>> call(AddWishListVacancyParams params) async =>
      await repository.addWishListVacancy(user: params.user, vacancy: params.vacancy);
}

class AddWishListVacancyParams extends Equatable {
  final int user;
  final int vacancy;

  const AddWishListVacancyParams({required this.vacancy, required this.user});

  @override
  List<Object?> get props => [user, vacancy];
}
