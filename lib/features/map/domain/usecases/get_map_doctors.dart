import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/doctor_spec.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetMapDoctorUseCase
    extends UseCase<GenericPagination<DoctorSpecModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DoctorSpecModel>>> call(params,
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
      fromJson: DoctorSpecModel.fromJson,
      query: query,
      next: param!.next,
    );
  }
}
