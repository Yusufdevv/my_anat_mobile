import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/data/models/category_list.dart';
import 'package:anatomica/features/vacancy/domain/repositories/vacancy_repository.dart';
import 'package:equatable/equatable.dart';

class CategoryListUseCase
    extends UseCase<GenericPagination<CategoryListModel>, CategoryListParams> {
  final VacancyRepository repository;

  CategoryListUseCase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CategoryListModel>>> call(
          CategoryListParams params) async =>
      await repository.getCategoryList();
}

class CategoryListParams extends Equatable {
  final String? next;

  const CategoryListParams({this.next});

  @override
  List<Object?> get props => [next];
}
