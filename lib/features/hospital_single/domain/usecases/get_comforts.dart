
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/models/comfort_model.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetComfortsUseCase extends UseCase<GenericPagination<ComfortModel>, TypeParameter> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<ComfortModel>>> call(TypeParameter param) {
    return repo.fetchMore<ComfortModel>(
        url: '/organization/facility/',
        fromJson: ComfortModel.fromJson,
        next: param.next.isEmpty?null:param.next,
        query:param.id==-1?{}:  {
          "organization_id":param.id
        });
  }
}
