part of 'comments_bloc.dart';

@Freezed()
 class CommentsState with _$CommentsState {
  factory CommentsState({
   @Default(FormzStatus.pure) FormzStatus status ,
   @Default([]) List<CommentModel> comments ,
   @Default('') String next ,
   @Default(0) int count ,
 })=_CommentsState;
 }

