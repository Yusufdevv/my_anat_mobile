part of 'journal_pages_bloc.dart';

class JournalPagesState extends Equatable {
  final String? next;
  final List<JournalPageEntity> pages;
  final FormzStatus getJournalPagesStatus;
  final bool fetchMore;
  final String? contentsNext;
  final List<JournalOutlineEntity> contents;
  final FormzStatus getJournalContentsStatus;
  final bool contentsFetchMore;
  final String slug;

  const JournalPagesState({
    this.pages = const [],
    this.getJournalPagesStatus = FormzStatus.pure,
    this.fetchMore = false,
    this.slug = '',
    this.next,
    this.contents = const [],
    this.getJournalContentsStatus = FormzStatus.pure,
    this.contentsFetchMore = false,
    this.contentsNext,
  });

  JournalPagesState copyWith({
    String? next,
    String? contentsNext,
    String? slug,
    List<JournalPageEntity>? pages,
    String? pagePath,
    FormzStatus? getJournalPagesStatus,
    bool? fetchMore,
    List<JournalOutlineEntity>? contents,
    FormzStatus? getJournalContentsStatus,
    bool? contentsFetchMore,
  }) =>
      JournalPagesState(
        pages: pages ?? this.pages,
        getJournalPagesStatus:
            getJournalPagesStatus ?? this.getJournalPagesStatus,
        fetchMore: fetchMore ?? this.fetchMore,
        next: next,
        contents: contents ?? this.contents,
        getJournalContentsStatus:
        getJournalContentsStatus ?? this.getJournalContentsStatus,
        contentsFetchMore: contentsFetchMore ?? this.contentsFetchMore,
        contentsNext: contentsNext,
        slug: slug ?? this.slug,
      );

  @override
  List<Object?> get props => [
    pages,
    getJournalPagesStatus,
    fetchMore,
    slug,
    next,
    contents,
    getJournalContentsStatus,
    contentsFetchMore,
    contentsNext,
      ];
}
