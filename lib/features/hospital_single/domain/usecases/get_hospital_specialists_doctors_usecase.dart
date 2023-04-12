import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetHospitalSpecialistsDoctorsUseCase implements UseCase<GenericPagination<HospitalDoctorsEntity>, TypeParameter> {
  final HospitalSingleRepository repository;
  GetHospitalSpecialistsDoctorsUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<HospitalDoctorsEntity>>> call(TypeParameter params) async =>
      repository.getHospitalSpecialistsDoctors(id: params.id, next: params.next);
}
