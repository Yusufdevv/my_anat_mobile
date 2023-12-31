import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class MostPopularOrgsUsecase
    implements UseCase<GenericPagination<OrgMapV2Model>, String?> {
  final HomeRepository repository = serviceLocator<HomeRepoImpl>();


  MostPopularOrgsUsecase( );

  @override
  Future<Either<Failure, GenericPagination<OrgMapV2Model>>> call(
          String? params) async =>
      await repository.getPopularOrgs(next: params);
}
