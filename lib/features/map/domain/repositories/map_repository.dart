import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class MapRepository {
  Future<Either<Failure, GenericPagination<TypeEntity>>> getTypes({String? next});
}
