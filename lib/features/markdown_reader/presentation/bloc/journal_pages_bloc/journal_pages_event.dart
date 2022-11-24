part of 'journal_pages_bloc.dart';

@immutable
abstract class JournalPagesEvent {}

class GetJournalPages extends JournalPagesEvent {
  final String slug;
  GetJournalPages({required this.slug});
}

class GetMoreJournalPages extends JournalPagesEvent {}
class GetJournalTableOfContents extends JournalPagesEvent {
  final String slug;
  GetJournalTableOfContents({required this.slug});
}

class GetMoreJournalTableOfContents extends JournalPagesEvent {}
