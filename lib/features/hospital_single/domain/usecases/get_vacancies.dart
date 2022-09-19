import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class GetHospitalVacancies extends UseCase<GenericPagination<VacancyListEntity>, TypeParameter> {
  final HospitalSingleRepository repository;
  GetHospitalVacancies({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<VacancyListEntity>>> call(TypeParameter params) async =>
      await repository.getHospitalVacancies(id: params.id, next: params.next);
}
