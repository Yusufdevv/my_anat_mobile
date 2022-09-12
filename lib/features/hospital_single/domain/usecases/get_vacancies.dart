import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy.dart';
import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class GetHospitalVacancies extends UseCase<GenericPagination<VacancyListModel>,TypeParameter >{
  final PaginationRepository repo = PaginationRepository();
  @override
  Future<Either<Failure, GenericPagination<VacancyListModel>>> call(param) {

    return repo.fetchMore<VacancyListModel>(
      url: '/vacancy/vacancy/list/',
      fromJson: VacancyListModel.fromJson,
      next: param.next.isEmpty?null:param.next,
      query: param.id==-1?{}: {
        "organization":param.id
      },
    );
  }

}