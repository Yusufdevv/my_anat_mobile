part of 'journal_bloc.dart';

@immutable
abstract class JournalEvent {}

class GetJournals extends JournalEvent {}

class GetMoreJournals extends JournalEvent {}

class GetJournalSingle extends JournalEvent {
  final String slug;
  GetJournalSingle({required this.slug});
}

class GetJournalArticles extends JournalEvent {}

class GetMoreJournalArticles extends JournalEvent {}

class GetFirstArticleDetail extends JournalEvent {
  final String slug;
  GetFirstArticleDetail({required this.slug});
}

class GetJournalSingleArticles extends JournalEvent {
  final int id;
  GetJournalSingleArticles({required this.id});
}

class GetMoreJournalSingleArticles extends JournalEvent {
  final int id;
  GetMoreJournalSingleArticles({required this.id});
}

class GetSingleArticle extends JournalEvent {
  final String slug;
  GetSingleArticle({required this.slug});
}
