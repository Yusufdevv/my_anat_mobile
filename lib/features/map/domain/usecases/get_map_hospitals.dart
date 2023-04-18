import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';

class GetMapHospitalUseCase extends UseCase<List<OrgMapV2Model>, String> {
  final GlobalRequestRepository repo = serviceLocator<GlobalRequestRepository>();

  @override
  Future<Either<Failure, List<OrgMapV2Model>>> call(params, {MapParameter? param}) {
    var query = <String, dynamic>{};
    if (params.isNotEmpty) {
      query.addAll({"search": params});
    }
    if (param != null) {
      query.addAll({
        "lat": param.lat,
        "lon": param.long,
        "rad": param.radius,
      });
      if (param.spec != -1) {
        query.addAll({'specialization': param.spec});
      }
    }
    return repo.getList<OrgMapV2Model>(
        endpoint: '/mobile/organization/map/',
        fromJson: OrgMapV2Model.fromJson,
        query: query,
        sendToken: StorageRepository.getString('token').isNotEmpty);
  }
}
