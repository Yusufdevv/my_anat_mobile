part of 'journal_db_bloc.dart';

@immutable
abstract class JournalDbEvent {}

class AddJournalToDb extends JournalDbEvent {
  final String imageUrl;
  final String redaction;
  final int journalId;
  AddJournalToDb({required this.redaction, required this.journalId, required this.imageUrl});
}

class GetJournalsFromDb extends JournalDbEvent {}
