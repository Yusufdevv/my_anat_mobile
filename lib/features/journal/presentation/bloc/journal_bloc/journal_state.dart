part of 'journal_bloc.dart';

class JournalState extends Equatable {
  final PaginatorStatus status;
  final String? next;
  final List<JournalEntity> journals;
  final bool fetchMore;
  final PaginatorStatus journalArticleStatus;
  final String? journalArticleNext;
  final List<JournalArticleEntity> journalArticles;
  final bool journalArticleFetchMore;
  final PaginatorStatus journalSingleArticleStatus;
  final String? journalSingleArticleNext;
  final List<JournalArticleEntity> journalSingleArticles;
  final bool journalSingleArticleFetchMore;
  final JournalArticleSingleEntity firstArticle;
  final FormzStatus getFirstArticleStatus;
  final JournalArticleSingleEntity articleSingle;
  final FormzStatus articleSingleStatus;
  final FormzStatus getJournalSingleStatus;
  final JournalSingleEntity journalSingle;
  const JournalState({
    this.status = PaginatorStatus.PAGINATOR_INITIAL,
    this.next,
    this.journals = const [],
    this.fetchMore = false,
    this.journalArticleStatus = PaginatorStatus.PAGINATOR_SUCCESS,
    this.journalArticleNext,
    this.journalArticles = const [],
    this.journalArticleFetchMore = false,
    this.journalSingleArticleStatus = PaginatorStatus.PAGINATOR_SUCCESS,
    this.journalSingleArticleNext,
    this.journalSingleArticles = const [],
    this.journalSingleArticleFetchMore = false,
    this.firstArticle = const JournalArticleSingleEntity(),
    this.getFirstArticleStatus = FormzStatus.pure,
    this.articleSingle = const JournalArticleSingleEntity(),
    this.articleSingleStatus = FormzStatus.pure,
    this.getJournalSingleStatus = FormzStatus.pure,
    this.journalSingle = const JournalSingleEntity(),
  });

  JournalState copyWith({
    PaginatorStatus? status,
    String? next,
    List<JournalEntity>? journals,
    bool? fetchMore,
    PaginatorStatus? journalArticleStatus,
    String? journalArticleNext,
    List<JournalArticleEntity>? journalArticles,
    bool? journalArticleFetchMore,
    PaginatorStatus? journalSingleArticleStatus,
    String? journalSingleArticleNext,
    List<JournalArticleEntity>? journalSingleArticles,
    bool? journalSingleArticleFetchMore,
    JournalArticleSingleEntity? firstArticle,
    FormzStatus? getFirstArticleStatus,
    JournalArticleSingleEntity? articleSingle,
    FormzStatus? articleSingleStatus,
    FormzStatus? getJournalSingleStatus,
    JournalSingleEntity? journalSingle,
  }) =>
      JournalState(
        next: next,
        journals: journals ?? this.journals,
        status: status ?? this.status,
        fetchMore: fetchMore ?? this.fetchMore,
        journalArticleStatus: journalArticleStatus ?? this.journalArticleStatus,
        journalArticleNext: journalArticleNext ?? this.journalArticleNext,
        journalArticles: journalArticles ?? this.journalArticles,
        journalArticleFetchMore: journalArticleFetchMore ?? this.journalArticleFetchMore,
        journalSingleArticleStatus: journalSingleArticleStatus ?? this.journalSingleArticleStatus,
        journalSingleArticleNext: journalSingleArticleNext ?? this.journalSingleArticleNext,
        journalSingleArticles: journalSingleArticles ?? this.journalSingleArticles,
        journalSingleArticleFetchMore: journalSingleArticleFetchMore ?? this.journalSingleArticleFetchMore,
        firstArticle: firstArticle ?? this.firstArticle,
        getFirstArticleStatus: getFirstArticleStatus ?? this.getFirstArticleStatus,
        articleSingle: articleSingle ?? this.articleSingle,
        articleSingleStatus: articleSingleStatus ?? this.articleSingleStatus,
        getJournalSingleStatus: getJournalSingleStatus ?? this.getJournalSingleStatus,
        journalSingle: journalSingle ?? this.journalSingle,
      );

  @override
  List<Object?> get props => [
        status,
        next,
        journals,
        fetchMore,
        journalArticleStatus,
        journalArticleNext,
        journalArticles,
        journalArticleFetchMore,
        firstArticle,
        getFirstArticleStatus,
        journalArticleStatus,
        journalArticleNext,
        journalArticles,
        journalArticleFetchMore,
        articleSingle,
        articleSingleStatus,
        getJournalSingleStatus,
        journalSingle,
      ];
}
