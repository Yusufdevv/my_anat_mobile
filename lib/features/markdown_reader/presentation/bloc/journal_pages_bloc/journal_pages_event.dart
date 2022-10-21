part of 'journal_pages_bloc.dart';

@immutable
abstract class JournalPagesEvent {}

class GetJournalPages extends JournalPagesEvent {
  final String slug;
  GetJournalPages({required this.slug});
}

class GetMoreJournalPages extends JournalPagesEvent {}
