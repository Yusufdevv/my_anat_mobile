import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';

class GetCommentsUseCase extends UseCase<GenericPagination<CommentEntity>, TypeParameter> {
  final HospitalSingleRepository repository;
  GetCommentsUseCase({required this.repository});
  @override
  Future<Either<Failure, GenericPagination<CommentEntity>>> call(TypeParameter params) async =>
      repository.getHospitalComments(id: params.id, next: params.next);
}
