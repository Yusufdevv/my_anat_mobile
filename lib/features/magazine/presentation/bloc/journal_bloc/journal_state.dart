part of 'journal_bloc.dart';

class JournalState extends Equatable {
  final PaginatorStatus status;
  final String? next;
  final List<JournalEntity> journals;
  final bool fetchMore;
  final PaginatorStatus searchStatus;
  final String? searchNext;
  final List<JournalEntity> searchJournals;
  final bool searchFetchMore;
  const JournalState({
    this.status = PaginatorStatus.PAGINATOR_INITIAL,
    this.next,
    this.journals = const [],
    this.fetchMore = false,
    this.searchStatus = PaginatorStatus.PAGINATOR_SUCCESS,
    this.searchNext,
    this.searchJournals = const [],
    this.searchFetchMore = false,
  });

  JournalState copyWith({
    PaginatorStatus? status,
    String? next,
    List<JournalEntity>? journals,
    bool? fetchMore,
    PaginatorStatus? searchStatus,
    String? searchNext,
    List<JournalEntity>? searchJournals,
    bool? searchFetchMore,
  }) =>
      JournalState(
        next: next,
        journals: journals ?? this.journals,
        status: status ?? this.status,
        fetchMore: fetchMore ?? this.fetchMore,
        searchNext: searchNext,
        searchJournals: searchJournals ?? this.searchJournals,
        searchStatus: searchStatus ?? this.searchStatus,
        searchFetchMore: searchFetchMore ?? this.searchFetchMore,
      );

  @override
  List<Object?> get props => [
        status,
        next,
        journals,
        fetchMore,
        searchStatus,
        searchNext,
        searchJournals,
        searchFetchMore,
      ];
}
