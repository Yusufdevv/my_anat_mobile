class JournalPageEntity {
  final int journal;
  final String content;
  final int page;
  final bool preview;
  const JournalPageEntity({
    this.page = 0,
    this.preview = false,
    this.journal = 0,
    this.content = '',
  });
}