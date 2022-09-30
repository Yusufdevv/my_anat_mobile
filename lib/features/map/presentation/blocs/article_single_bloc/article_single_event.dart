part of 'article_single_bloc.dart';

@Freezed()
abstract class ArticleSingleEvent with _$ArticleSingleEvent {
  factory ArticleSingleEvent.getSingleArticle({required String slug}) = _GetSingleArticle;
}
