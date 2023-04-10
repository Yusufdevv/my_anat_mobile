import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/doctor_map_model.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/domain/entities/doctor_map_entity.dart';
import 'package:anatomica/features/map/domain/entities/map_parameter.dart';

class GetMapDoctorUseCase extends UseCase<List<DoctorMapEntity>, String> {
  final GlobalRequestRepository repo = GlobalRequestRepository();

  @override
  Future<Either<Failure, List<DoctorMapEntity>>> call(params, {MapParameter? param}) {
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
    print('repo => ${query}');
    return repo.getList(
        endpoint: '/mobile/doctor/map/',
        fromJson: DoctorMapModel.fromJson,
        query: query,
        responseDataKey: 'results',
        sendToken: StorageRepository.getString('token').isNotEmpty);
  }
}
