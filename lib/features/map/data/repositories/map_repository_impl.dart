import 'package:anatomica/core/exceptions/exceptions.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/map/data/datasources/map_datasource.dart';
import 'package:anatomica/features/map/domain/repositories/map_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class MapRepositoryImpl extends MapRepository {
  final MapDatasource datasource;
  MapRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, GenericPagination<TypeEntity>>> getTypes({String? next}) async {
    try {
      final result = await datasource.getTypes(next: next);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode));
    }
  }
}
