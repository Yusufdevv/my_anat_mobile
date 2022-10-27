part of 'journal_pages_bloc.dart';

class JournalPagesState extends Equatable {
  final String? next;
  final List<JournalPageEntity> pages;
  final String pagePath;
  final FormzStatus getJournalPagesStatus;
  final bool fetchMore;
  final String slug;
  const JournalPagesState({
    this.pages = const [],
    this.pagePath = '',
    this.getJournalPagesStatus = FormzStatus.pure,
    this.fetchMore = false,
    this.slug = '',
    this.next,
  });
  JournalPagesState copyWith({
    String? next,
    String? slug,
    List<JournalPageEntity>? pages,
    String? pagePath,
    FormzStatus? getJournalPagesStatus,
    bool? fetchMore,
  }) =>
      JournalPagesState(
        pages: pages ?? this.pages,
        pagePath: pagePath ?? this.pagePath,
        getJournalPagesStatus: getJournalPagesStatus ?? this.getJournalPagesStatus,
        fetchMore: fetchMore ?? this.fetchMore,
        next: next,
        slug: slug ?? this.slug,
      );

  @override
  List<Object?> get props => [
        pages,
        pagePath,
        getJournalPagesStatus,
        fetchMore,
        slug,
        next,
      ];
}
