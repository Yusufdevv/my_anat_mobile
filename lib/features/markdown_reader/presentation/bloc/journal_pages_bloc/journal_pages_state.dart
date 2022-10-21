part of 'journal_pages_bloc.dart';

class JournalPagesState extends Equatable {
  final String? next;
  final List<JournalPageEntity> pages;
  final FormzStatus getJournalPagesStatus;
  final bool fetchMore;
  final String slug;
  const JournalPagesState({
    this.pages = const [],
    this.getJournalPagesStatus = FormzStatus.pure,
    this.fetchMore = false,
    this.slug = '',
    this.next,
  });
  JournalPagesState copyWith({
    String? next,
    String? slug,
    List<JournalPageEntity>? pages,
    FormzStatus? getJournalPagesStatus,
    bool? fetchMore,
  }) =>
      JournalPagesState(
        pages: pages ?? this.pages,
        getJournalPagesStatus: getJournalPagesStatus ?? this.getJournalPagesStatus,
        fetchMore: fetchMore ?? this.fetchMore,
        next: next,
        slug: slug ?? this.slug,
      );

  @override
  List<Object?> get props => [
        pages,
        getJournalPagesStatus,
        fetchMore,
        slug,
        next,
      ];
}
