import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/map/domain/usecases/get_hospitals.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetDoctorsUseCase
    extends UseCase<GenericPagination<HospitalDoctorsModel>, SearchParam> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<HospitalDoctorsModel>>> call(
      SearchParam param) {
    return repo.fetchMore<HospitalDoctorsModel>(
        url: '/doctor/',
        next: param.next.isNotEmpty ? param.next : null,
        fromJson: HospitalDoctorsModel.fromJson,
        query: param.search != null ? {"search": param.search} : {});
  }
}
