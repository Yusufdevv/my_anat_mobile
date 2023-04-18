import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/doctor_map_model.dart'; 
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetDoctorsUseCase extends UseCase<GenericPagination<DoctorMapModel>, MapV2Params> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DoctorMapModel>>> call(MapV2Params params) async {
    final Map<String, dynamic> queryParams = {
      'lat': params.latitude > 0 ? params.latitude : 41,
      'lon': params.longitude > 0 ? params.longitude : 69,
      'rad': params.radius,
    };
    if (params.specializationId != null) {
      queryParams.putIfAbsent('specialization', () => params.specializationId);
    }
    if (params.search != null) {
      queryParams.putIfAbsent('search', () => params.search);
    }
    if (params.region != null) {
      queryParams.putIfAbsent('region', () => params.region);
    }
    if (params.district != null) {
      queryParams.putIfAbsent('district', () => params.district);
    }
    if (params.service != null) {
      queryParams.putIfAbsent('service', () => params.service);
    }
    if (params.limit != null) {
      queryParams.putIfAbsent('limit', () => params.limit);
    }
    if (params.offset != null) {
      queryParams.putIfAbsent('offset', () => params.offset);
    }
    if (params.title != null && params.title!.isNotEmpty) {
      queryParams.putIfAbsent('title', () => params.title);
    }
    print('doctor/ ${params.next} search ${params.search}');
    final result = await repo.fetchMore(
        url: '/mobile/doctor/map/',
        next: params.next,
        fromJson: DoctorMapModel.fromJson,
        query: params.search != null ? queryParams : {});
    return result;
  }
}
