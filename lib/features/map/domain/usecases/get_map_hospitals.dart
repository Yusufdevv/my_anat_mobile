import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';

class GetMapHospitalUseCase extends UseCase<List<MapHospitalModel>, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, List<MapHospitalModel>>> call(search, {MapParameter? param}) {
    var query = <String, dynamic>{};
    if (search.isNotEmpty) {
      query.addAll({"search": search});
    }
    if (param != null) {
      query.addAll({
        "lat": param.lat,
        "lon": param.long,
        "rad": param.radius,
      });
      if(param.spec!=-1){
        query.addAll({
          'specialization':param.spec
        });
      }
    }
    return repo.getList<MapHospitalModel>(
        endpoint: '/mobile/organization/map/',
        fromJson: MapHospitalModel.fromJson,
        query: query,
        sendToken: StorageRepository.getString('token').isNotEmpty);
  }
}
