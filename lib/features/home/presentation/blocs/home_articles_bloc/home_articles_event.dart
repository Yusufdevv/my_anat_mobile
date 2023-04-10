part of 'home_articles_bloc.dart';

@freezed
class HomeArticlesEvent with _$HomeArticlesEvent {
  const factory HomeArticlesEvent.getHomeArticles() = _GetHomeArticles;

  const factory HomeArticlesEvent.getMoreHomeArticles() = _GetMoreHomeArticles;

  const factory HomeArticlesEvent.getBanners() = _GetBanners;

  const factory HomeArticlesEvent.getMoreBanners() = _GetMoreBanners;
}
