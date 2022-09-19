part of 'h_articles_bloc.dart';

@Freezed()
class HArticlesEvent with _$HArticlesEvent {
  factory HArticlesEvent.getArticles({required int organizationId}) = _GetArticles;
  factory HArticlesEvent.getMoreArticles() = _GetMoreArticles;
}
