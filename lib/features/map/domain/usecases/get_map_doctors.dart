import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/repository/global_requst_repository.dart';
import 'package:anatomica/features/map/data/models/map_doctor.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetMapDoctorUseCase
    extends UseCase<GenericPagination<MapDoctorModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<MapDoctorModel>>> call(params,
      {MapV2Params? param}) {
    var query = <String, dynamic>{};
    if (params.isNotEmpty) {
      query.addAll({"search": params});
    }
    if (param != null) {
      query.addAll({
        "lat": param.latitude,
        "lon": param.longitude,
        "rad": param.radius,
        "offset": param.offset,
        "limit": param.limit,
      });
    }
    print('repo => ${query}');
    return repo.fetchMore(
      url: '/mobile/doctor/map/',
      fromJson: MapDoctorModel.fromJson,
      query: query,
      next: param!.next,
    );
  }
}
