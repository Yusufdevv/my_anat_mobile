
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetSpecialistsUseCase extends UseCase<GenericPagination<DoctorsModel>, TypeParameter> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<DoctorsModel>>> call(TypeParameter param) {
    return repo.fetchMore<DoctorsModel>(
        url: '/organization/doctor/',
        fromJson: DoctorsModel.fromJson,
        next: param.next.isEmpty?null:param.next,
        query: param.id==-1?{}: {
          "organization_id":param.id
        });
  }
}
