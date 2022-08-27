import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class RelatedVacancyListUseCase extends UseCase<GenericPagination<VacancyListEntity>,
    RelatedVacancyListParams> {
  final VacancyRepository repository;

  RelatedVacancyListUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<VacancyListEntity>>> call(RelatedVacancyListParams params)
  async =>
      await repository.getRelationVacancyList(slug: params.slug);
}

class RelatedVacancyListParams extends Equatable {
  final String slug;

  const RelatedVacancyListParams({required this.slug});

  @override
  List<Object?> get props => [slug];
}
