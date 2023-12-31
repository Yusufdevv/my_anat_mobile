import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/organization_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetHospitalsUseCase
    extends UseCase<GenericPagination<HospitalModel>, SearchParam> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<HospitalModel>>> call(
      SearchParam params) {
    return repo.fetchMore(
        url: '/organization/',
        next: params.next,
        fromJson: HospitalModel.fromJson,
        query: params.search != null ? {"search": params.search} : {});
  }
}

class SearchParam {
  final String? next;

  final String? search;

  SearchParam({this.next, this.search});
}
