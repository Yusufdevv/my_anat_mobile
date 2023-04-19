import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart'; 
import 'package:anatomica/features/home/data/repository_impls/home_repo_impl.dart';
import 'package:anatomica/features/home/domain/repositories/home_repository.dart';
import 'package:anatomica/features/map/data/models/doctor_map_model.dart'; 
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class MostPopularDoctorsUsecase
    implements UseCase<GenericPagination<DoctorMapModel>, String?> {
  final HomeRepository repository = serviceLocator<HomeRepoImpl>();


  MostPopularDoctorsUsecase();

  @override
  Future<Either<Failure, GenericPagination<DoctorMapModel>>> call(
          String? params) async =>
      await repository.getPopularDoctors(next: params);
}
