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
  final int fontSizeIndex;

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
    this.fontSizeIndex = 3,
  });

  JournalPagesState copyWith({
    int? fontSizeIndex,
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
        fontSizeIndex: fontSizeIndex ?? this.fontSizeIndex,
        pages: pages ?? this.pages,
        getJournalPagesStatus:
            getJournalPagesStatus ?? this.getJournalPagesStatus,
        fetchMore: fetchMore ?? this.fetchMore,
        next: next ?? this.next,
        contents: contents ?? this.contents,
        getJournalContentsStatus:
            getJournalContentsStatus ?? this.getJournalContentsStatus,
        contentsFetchMore: contentsFetchMore ?? this.contentsFetchMore,
        contentsNext: contentsNext,
        slug: slug ?? this.slug,
      );
  List<JournalPageEntity> getPages({required bool isPreview}) {
    if (isPreview) {
      return pages.where((element) => element.preview).toList();
    }
    return pages;
  }

  @override
  List<Object?> get props => [
        fontSizeIndex,
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
