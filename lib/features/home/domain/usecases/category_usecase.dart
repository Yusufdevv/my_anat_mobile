import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart'; 
import 'package:anatomica/features/home/domain/entities/category_entity.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class CategoryUsecase
    implements UseCase<GenericPagination<CategoryEntity>, String?> {
  final HomeRepository repository;

  CategoryUsecase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<CategoryEntity>>> call(
          String? params) async =>
      await repository.getCategories(next: params);
}
