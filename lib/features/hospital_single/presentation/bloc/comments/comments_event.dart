part of 'comments_bloc.dart';

@Freezed()
 class CommentsEvent with _$CommentsEvent {
factory CommentsEvent.getComments({int? organizationId})=_GetComments;
 }

