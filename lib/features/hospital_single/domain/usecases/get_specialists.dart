
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetSpecialistsUseCase extends UseCase<GenericPagination<DoctorsModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DoctorsModel>>> call(String next) {
    return repo.fetchMore<DoctorsModel>(
        url: '/organization/doctor/',
        fromJson: DoctorsModel.fromJson,
        next: next.isEmpty?null:next);
  }
}
