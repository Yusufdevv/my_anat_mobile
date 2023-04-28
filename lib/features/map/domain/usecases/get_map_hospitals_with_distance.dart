import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/repositories/map_repository.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetHopitalsMapUseCase extends UseCase<GenericPagination<OrgMapV2Model>, MapV2Params> {
  final MapRepository mapRepository;

  GetHopitalsMapUseCase({required this.mapRepository});

  @override
  Future<Either<Failure, GenericPagination<OrgMapV2Model>>> call(MapV2Params params) async =>
      await mapRepository.getOrgMapV2(v2params: params);
}
