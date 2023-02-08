import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/service_spec_suggest_model.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';

class GetServicesV2UseCase
    implements UseCase<List<ServiceSpecSuggestModel>, String?> {
  final MapRepositoryImpl repository;
  GetServicesV2UseCase({required this.repository});
  @override
  Future<Either<Failure, List<ServiceSpecSuggestModel>>> call(
          String? params) async =>
      await repository.getServices(searchText: params);
}
