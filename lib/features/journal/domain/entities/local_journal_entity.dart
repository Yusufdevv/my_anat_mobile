class LocalJournalEntity {
  final int journalId;
  final String imageUrl;
  final String redaction;
  const LocalJournalEntity({
    required this.imageUrl,
    required this.journalId,
    required this.redaction,
  });
}
