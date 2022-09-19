import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';

class GetSingleHospitalUseCase extends UseCase<HospitalSingleEntity, String> {
  final HospitalSingleRepository repository;
  GetSingleHospitalUseCase({required this.repository});
  @override
  Future<Either<Failure, HospitalSingleEntity>> call(String params) async {
    return await repository.getHospitalSingle(slug: params);
  }
}
