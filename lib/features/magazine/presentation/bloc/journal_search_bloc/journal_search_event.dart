part of 'journal_search_bloc.dart';

@immutable
abstract class JournalSearchEvent {}

class SearchArticles extends JournalSearchEvent {
  final String query;
  SearchArticles({required this.query});
}

class MoreSearchArticles extends JournalSearchState {}

class MoreSearchJournals extends JournalSearchEvent {}

class SearchJournals extends JournalSearchEvent {
  final String query;
  SearchJournals({required this.query});
}
