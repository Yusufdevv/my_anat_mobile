part of 'home_articles_bloc.dart';

@freezed
class HomeArticlesState with _$HomeArticlesState {
  factory HomeArticlesState({
    @Default([]) List<JournalArticleModel> homeArticles,
    @Default(FormzStatus.pure) FormzStatus homeArticlesStatus,
    String? homeArticlesNext,
    @Default(false) bool homeArticlesFetchMore,
    @Default([]) List<BannerModel> banners,
    @Default(FormzStatus.pure) FormzStatus bannersStatus,
    String? bannersNext,
    @Default(false) bool bannersFetchMore,
  }) = _HomeArticlesState;
}
