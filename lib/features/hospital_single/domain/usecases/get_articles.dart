import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/journal/domain/entities/article_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetHArticlesUseCase extends UseCase<GenericPagination<JournalArticleEntity>, TypeParameter> {
  final HospitalSingleRepository repository;
  GetHArticlesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> call(TypeParameter params) async =>
      await repository.getHospitalArticles(id: params.id, next: params.next);
}

class TypeParameter {
  final String? next;
  final int id;
  TypeParameter({required this.id, this.next});
}
