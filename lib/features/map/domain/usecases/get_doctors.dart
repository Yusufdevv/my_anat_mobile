import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/map/data/models/organization_model.dart';
import 'package:anatomica/features/map/domain/entities/hospital_entity.dart';
import 'package:anatomica/features/map/domain/usecases/get_hospitals.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';

class GetDoctorsUseCase
    extends UseCase<GenericPagination<DoctorsModel>, SearchParam> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DoctorsModel>>> call(
      SearchParam param) {
    return repo.fetchMore(
        url: '/doctor/',
        next: param.next.isNotEmpty ? param.next : null,
        fromJson: DoctorsModel.fromJson,
        query: param.search != null ? {"search": param.search} : {});
  }
}
