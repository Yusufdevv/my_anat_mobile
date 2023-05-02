import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:equatable/equatable.dart';

class JournalArticleEntity extends Equatable {
  final int id;
  final String title;
  final String slug;
  @ImageConverter()
  final ImageEntity image;
  final String publishDate;
  @CategoryEntityConverter()
  final CategoryEntity category;
  final bool isPremium;
  final String redaction;
  final int viewCount;
  final bool isBought;
  final bool isPaidForPublish;
  final String moderationStatus;
  final List<String?> authors;

  const JournalArticleEntity({
    this.redaction = '',
    this.image = const ImageEntity(),
    this.publishDate = '',
    this.id = 0,
    this.slug = '',
    this.moderationStatus = '',
    this.category = const CategoryEntity(),
    this.isPremium = false,
    this.isBought = false,
    this.isPaidForPublish = false,
    this.title = '',
    this.viewCount = 0,
    this.authors = const [],
  });

  @override
  List<Object?> get props => [
        redaction,
        image,
        publishDate,
        id,
        slug,
        moderationStatus,
        category,
        isPremium,
        isBought,
        isPaidForPublish,
        title,
        viewCount,
        authors,
      ];
}
