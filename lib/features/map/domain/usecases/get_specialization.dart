import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetSpecializationUseCase
    extends UseCase<GenericPagination<TitlerModel>, String?> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<TitlerModel>>> call(String? params) {
    return repo.fetchMore(
        url: '/organization/specialization/', fromJson: TitlerModel.fromJson,next: params);
  }
}
