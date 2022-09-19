import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/either.dart';
import 'package:anatomica/features/hospital_single/domain/entities/post_comment_entity.dart';
import 'package:anatomica/features/hospital_single/domain/repositories/hospital_single_repository.dart';
import 'package:equatable/equatable.dart';

class PostCommentUseCase implements UseCase<void, PostCommentParams> {
  final HospitalSingleRepository repository;
  PostCommentUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(PostCommentParams params) async =>
      await repository.postComment(organizationId: params.organizationId, comment: params.comment);
}

class PostCommentParams extends Equatable {
  final int organizationId;
  final PostCommentEntity comment;
  const PostCommentParams({
    required this.comment,
    required this.organizationId,
  });

  @override
  List<Object?> get props => [organizationId, comment];
}
