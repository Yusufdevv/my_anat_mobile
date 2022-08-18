class MagazineItemEntity {
  final String imageUrl;
  final String today;
  final String date;
  final String authorName;
  final int price;
  final bool isFollowed;
  final String title;

  const MagazineItemEntity({
    required this.imageUrl,
    required this.date,
    required this.authorName,
    required this.price,
    this.isFollowed = false,
    this.today = '',
    required this.title,
  });
}
