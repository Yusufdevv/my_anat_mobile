import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/models/service_spec_suggest_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

abstract class MapRepository {
  Future<Either<Failure, GenericPagination<TypeEntity>>> getTypes(
      {String? next});
  Future<Either<Failure, List<ServiceSpecSuggestModel>>> getServices(
      {String? searchText});
  Future<Either<Failure, GenericPagination<OrgMapV2Model>>> getOrgMapV2(
      {required MapV2Params v2params});
}
