import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/doctor_single/domain/repositories/doctor_single_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetDoctorArticlesUseCase implements UseCase<GenericPagination<JournalArticleEntity>, TypeParameter> {
  final DoctorSingleRepository repository;
  GetDoctorArticlesUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<JournalArticleEntity>>> call(TypeParameter params) async =>
      await repository.getDoctorArticles(id: params.id, next: params.next);
}
