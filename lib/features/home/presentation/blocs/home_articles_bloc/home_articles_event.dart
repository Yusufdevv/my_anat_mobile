part of 'home_articles_bloc.dart';

@freezed
class HomeArticlesEvent with _$HomeArticlesEvent {
  const factory HomeArticlesEvent.getHomeArticles() = _GetHomeArticles;

  const factory HomeArticlesEvent.getMoreHomeArticles() = _GetMoreHomeArticles;
}
