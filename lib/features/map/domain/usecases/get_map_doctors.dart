import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';

class GetMapDoctorUseCase extends UseCase<List<MapDoctorModel>, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, List<MapDoctorModel>>> call(params, {MapParameter? param}) {
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
    }

    return repo.getList(
        endpoint: '/mobile/doctor/map/',
        fromJson: MapDoctorModel.fromJson,
        query: query,
        sendToken: StorageRepository.getString('token').isNotEmpty);
  }
}
