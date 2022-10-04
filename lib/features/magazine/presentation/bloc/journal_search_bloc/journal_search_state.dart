part of 'journal_search_bloc.dart';

class JournalSearchState extends Equatable {
  final PaginatorStatus searchStatus;
  final String? searchNext;
  final List<JournalEntity> searchJournals;
  final bool searchFetchMore;
  final FormzStatus searchArticleStatus;
  final String? searchArticleNext;
  final List<JournalArticleEntity> searchArticles;
  final bool searchArticleFetchMore;
  final String query;
  final String articleQuery;

  const JournalSearchState({
    this.searchStatus = PaginatorStatus.PAGINATOR_SUCCESS,
    this.searchNext,
    this.searchJournals = const [],
    this.searchFetchMore = false,
    this.searchArticleStatus = FormzStatus.pure,
    this.searchArticleNext,
    this.searchArticles = const [],
    this.searchArticleFetchMore = false,
    this.query = '',
    this.articleQuery = '',
  });
  JournalSearchState copyWith({
    PaginatorStatus? searchStatus,
    String? searchNext,
    List<JournalEntity>? searchJournals,
    bool? searchFetchMore,
    String? query,
    String? articleQuery,
    FormzStatus? searchArticleStatus,
    String? searchArticleNext,
    List<JournalArticleEntity>? searchArticles,
    bool? searchArticleFetchMore,
  }) =>
      JournalSearchState(
        searchNext: searchNext,
        searchJournals: searchJournals ?? this.searchJournals,
        searchStatus: searchStatus ?? this.searchStatus,
        searchFetchMore: searchFetchMore ?? this.searchFetchMore,
        searchArticleStatus: searchArticleStatus ?? this.searchArticleStatus,
        searchArticleNext: searchArticleNext,
        searchArticles: searchArticles ?? this.searchArticles,
        searchArticleFetchMore: searchArticleFetchMore ?? this.searchArticleFetchMore,
        articleQuery: articleQuery ?? this.articleQuery,
      );

  @override
  List<Object?> get props => [
        searchStatus,
        searchNext,
        searchJournals,
        searchFetchMore,
        searchArticleStatus,
        searchArticleNext,
        searchArticles,
        searchArticleFetchMore,
        query,
        articleQuery,
      ];
}
