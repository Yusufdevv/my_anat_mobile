class JournalOutlineEntity {
  final int id;
  final int page;
  final String title;
  final String image;
  final int readTime;
  final String author;

  const JournalOutlineEntity({
    this.author = '',
    this.id = 0,
    this.image = '',
    this.page = 0,
    this.readTime = 0,
    this.title = '',
  });
}
