part of 'journal_pages_bloc.dart';

abstract class JournalPagesEvent {}

class JournalUpgradeFontSizeEvent extends JournalPagesEvent {
  JournalUpgradeFontSizeEvent();
}

class JournalDownGradeFontSizeEvent extends JournalPagesEvent {
  JournalDownGradeFontSizeEvent();
}

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
