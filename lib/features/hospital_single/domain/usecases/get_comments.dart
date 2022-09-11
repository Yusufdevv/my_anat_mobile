import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/data/models/comments.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/pagination/data/models/generic_pagination.dart';
import 'package:anatomica/features/pagination/data/repository/pagination.dart';

class GetCommentsUseCase extends UseCase<GenericPagination<CommentModel>, TypeParameter> {
  final PaginationRepository repo = PaginationRepository();

  @override
  Future<Either<Failure, GenericPagination<CommentModel>>> call(param) {
    return repo.fetchMore<CommentModel>(
        url: '/organization/comment/',
        fromJson: CommentModel.fromJson,
        next: param.next.isEmpty ? null : param.next,
        query: param.id == -1 ? {} : {"organization_id": param.id});
  }
}
