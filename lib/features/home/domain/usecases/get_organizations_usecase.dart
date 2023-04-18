import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart'; 
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetOrganizationsUsecase implements UseCase<GenericPagination<OrgMapV2Model>, OrganizationParams> {
  final HomeRepository repository = serviceLocator<HomeRepoImpl>();

  @override
  Future<Either<Failure, GenericPagination<OrgMapV2Model>>> call(OrganizationParams params) async =>
      await repository.getOrganizations(next: params.next, type: params.type);
}

class OrganizationParams {
  final String? next;
  final int type;
  OrganizationParams({required this.type, this.next});
}
