
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/repository/global_requst_repository.dart';
import 'package:anatomica/features/hospital_single/data/models/comments.dart';
import 'package:anatomica/features/hospital_single/data/models/service.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetServicesUseCase extends UseCase<GenericPagination<SingleServiceModel>, String> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<SingleServiceModel>>> call(String next) {
    return repo.fetchMore<SingleServiceModel>(
        url: '/organization/service/',
        fromJson: SingleServiceModel.fromJson,
        next: next.isEmpty?null:next);
  }
}
