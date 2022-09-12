import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';

class GetMapDoctorUseCase extends UseCase<List<MapDoctorModel>, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, List<MapDoctorModel>>> call(search,
      {MapParameter? param}) {
    var query = <String, dynamic>{};
    if (search.isNotEmpty) {
      query.addAll({"search": "search"});
    }
    if (param != null) {
      query.addAll({
        "lat": param.lat,
        "lon": param.long,
        "rad": param.radius,
      });
    }
    return repo.getList<MapDoctorModel>(
        endpoint: '/mobile/doctor/map/',
        fromJson: MapDoctorModel.fromJson,
        query: query);
  }
}
