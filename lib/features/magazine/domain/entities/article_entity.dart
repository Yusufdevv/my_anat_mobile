import 'package:anatomica/features/auth/data/models/image_model.dart';
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
  const JournalArticleEntity({
    this.redaction = '',
    this.image = const ImageEntity(),
    this.publishDate = '',
    this.id = 0,
    this.slug = '',
    this.category = const CategoryEntity(),
    this.isPremium = false,
    this.title = '',
    this.viewCount = 0,
  });
  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        image,
        publishDate,
        category,
        isPremium,
        redaction,
        viewCount,
      ];
}
