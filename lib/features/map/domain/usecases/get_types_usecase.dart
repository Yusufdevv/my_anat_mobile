import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetTypesUseCase
    implements UseCase<GenericPagination<TypeEntity>, String?> {
  final MapRepositoryImpl repository;
  GetTypesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<TypeEntity>>> call(
          String? params) async =>
      await repository.getTypes(next: params);
}
