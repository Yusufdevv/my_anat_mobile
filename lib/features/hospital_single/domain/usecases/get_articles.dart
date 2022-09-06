
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/models/comfort_model.dart';
import 'package:anatomica/features/magazine/data/models/journal_article_model.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetHArticlesUseCase extends UseCase<GenericPagination<JournalArticleModel>, TypeParameter> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<JournalArticleModel>>> call(TypeParameter param) {
    return repo.fetchMore<JournalArticleModel>(
        url: '/article/',
        fromJson: JournalArticleModel.fromJson,
        next: param.next.isEmpty?null:param.next,
      query: param.id==-1?{}: {
          "organization":param.id
    },
    );
  }
}

class TypeParameter {
  final String next ;
  final int id ;
  TypeParameter({required this.id,required this.next});
}
