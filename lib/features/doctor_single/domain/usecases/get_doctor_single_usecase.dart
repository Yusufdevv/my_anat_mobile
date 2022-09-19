import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/domain/entities/doctor_sinlge_entity.dart';
import 'package:anatomica/features/doctor_single/domain/repositories/doctor_single_repository.dart';

class GetDoctorSingleUseCase implements UseCase<DoctorSingleEntity, int> {
  final DoctorSingleRepository repository;
  GetDoctorSingleUseCase({required this.repository});
  @override
  Future<Either<Failure, DoctorSingleEntity>> call(int params) async => await repository.getDoctorSingle(id: params);
}
