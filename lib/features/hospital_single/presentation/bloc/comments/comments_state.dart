part of 'comments_bloc.dart';

@Freezed()
class CommentsState with _$CommentsState {
  factory CommentsState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default([]) List<CommentEntity> comments,
    String? next,
    @Default(false) bool fetchMore,
    @Default(0) int organizationId,
    @Default(FormzStatus.pure) FormzStatus doctorCommentStatus,
    @Default([]) List<CommentEntity> doctorComments,
    String? doctorCommentNext,
    @Default(false) bool doctorCommentFetchMore,
    @Default(0) int doctorId,
    @Default(0) int doctorCommentCount,
    @Default(0) int hospitalCommentCount,
    @Default(FormzStatus.pure) postCommentStatus,
  }) = _CommentsState;
}
