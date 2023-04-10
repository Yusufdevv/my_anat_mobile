import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class MostPopularDoctorsUsecase
    implements UseCase<GenericPagination<HospitalDoctorsModel>, String?> {
  final HomeRepository repository;

  MostPopularDoctorsUsecase({required this.repository});

  @override
  Future<Either<Failure, GenericPagination<HospitalDoctorsModel>>> call(
          String? params) async =>
      await repository.getPopularDoctors(next: params);
}
