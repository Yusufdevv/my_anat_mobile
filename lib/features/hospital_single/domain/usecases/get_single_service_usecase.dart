import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/repository/hospital_repository_impl.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_single.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';

class GetSingleServiceUseCase
    implements UseCase<HospitalServiceSingleEntity, int> {
  final HospitalSingleRepository repository = serviceLocator<HospitalSingleRepositoryImpl>();
  GetSingleServiceUseCase();
  @override
  Future<Either<Failure, HospitalServiceSingleEntity>> call(int params) async =>
      await repository.getServiceSingle(id: params);
}
