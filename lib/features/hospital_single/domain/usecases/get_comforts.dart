import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetComfortsUseCase extends UseCase<GenericPagination<ComfortEntity>, TypeParameter> {
  final HospitalSingleRepository repository;
  GetComfortsUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<ComfortEntity>>> call(TypeParameter params) async =>
      await repository.getHospitalConditions(id: params.id, next: params.next);
}
