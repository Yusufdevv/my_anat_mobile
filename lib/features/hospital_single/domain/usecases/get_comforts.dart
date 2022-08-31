
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/models/comfort_model.dart';
import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetComfortsUseCase extends UseCase<GenericPagination<ComfortModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<ComfortModel>>> call(String next) {
    return repo.fetchMore<ComfortModel>(
        url: '/organization/facility/',
        fromJson: ComfortModel.fromJson,
        next: next.isEmpty?null:next);
  }
}
