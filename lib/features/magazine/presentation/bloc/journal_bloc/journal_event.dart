part of 'journal_bloc.dart';

@immutable
abstract class JournalEvent {}

class GetJournals extends JournalEvent {}

class GetMoreJournals extends JournalEvent {}

class SearchJournals extends JournalEvent {
  final String query;
  SearchJournals({required this.query});
}

class MoreSearchJournals extends JournalEvent {}
