import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/magazine/data/models/tag_model.dart';
import 'package:anatomica/features/magazine/domain/entities/preview_entity.dart';
import 'package:anatomica/features/magazine/domain/entities/tag_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';

class JournalSingleEntity {
  final int id;
  final String name;
  final String slug;
  final String description;
  @ImageConverter()
  final ImageEntity image;
  final int organizationId;
  @CategoryEntityConverter()
  final CategoryEntity category;
  final String redaction;
  @PreviewEntityConverter()
  final PreviewEntity preview;
  final bool isPremium;
  final int price;
  final bool isActive;
  final String publishDate;
  @TagConverter()
  final List<TagEntity> tags;
  const JournalSingleEntity({
    this.image = const ImageEntity(),
    this.isPremium = false,
    this.id = 0,
    this.description = '',
    this.slug = '',
    this.category = const CategoryEntity(),
    this.name = '',
    this.isActive = false,
    this.organizationId = 0,
    this.price = 0,
    this.redaction = '',
    this.publishDate = '',
    this.tags = const [],
    this.preview = const PreviewEntity(),
  });
}
