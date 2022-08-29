import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/organization_model.dart';
import 'package:anatomica/features/map/domain/entities/hospital_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';

class GetHospitalsUseCase
    extends UseCase<GenericPagination<HospitalModel>, SearchParam> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<HospitalModel>>> call(
      SearchParam param) {
    return repo.fetchMore(url: '/organization/',
        next: param.next.isNotEmpty ? param.next : null,
        fromJson: HospitalModel.fromJson,
        query: param.search != null ? {
          "search": param.search
        }:{});
  }

}

class SearchParam {
  final String next;

  final String? search;

  SearchParam({required this.next, this.search});
}