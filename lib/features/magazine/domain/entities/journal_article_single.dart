import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:equatable/equatable.dart';

class JournalArticleSingleEntity extends Equatable {
  final int id;
  final String title;
  final String slug;
  @ImageConverter()
  final ImageEntity image;
  @CategoryEntityConverter()
  final CategoryEntity category;
  final String redaction;
  final String shortDescription;
  final String description;
  final int price;
  final int journal;
  final String publishDate;
  final int organization;
  final int viewCount;
  final bool isPremium;

  const JournalArticleSingleEntity({
    this.slug = '',
    this.title = '',
    this.image = const ImageEntity(),
    this.id = 0,
    this.redaction = '',
    this.publishDate = '',
    this.category = const CategoryEntity(),
    this.isPremium = false,
    this.viewCount = 0,
    this.description = '',
    this.organization = 0,
    this.price = 0,
    this.journal = 0,
    this.shortDescription = '',
  });
  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        image,
        category,
        redaction,
        shortDescription,
        description,
        price,
        journal,
        publishDate,
        organization,
        viewCount,
        isPremium,
      ];
}
