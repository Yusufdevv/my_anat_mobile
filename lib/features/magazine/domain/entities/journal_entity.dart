import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/magazine/data/models/tag_model.dart';
import 'package:anatomica/features/magazine/domain/entities/tag_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:equatable/equatable.dart';

class JournalEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String description;
  @ImageConverter()
  final ImageEntity image;
  @CategoryEntityConverter()
  final CategoryEntity category;
  final int organization;
  final String redaction;
  final bool isPremium;
  final int price;
  final String publishDate;
  @TagConverter()
  final List<TagEntity> tags;
  const JournalEntity({
    this.id = 0,
    this.name = '',
    this.slug = '',
    this.description = '',
    this.image = const ImageEntity(),
    this.organization = 0,
    this.redaction = '',
    this.price = 0,
    this.category = const CategoryEntity(),
    this.isPremium = false,
    this.publishDate = '',
    this.tags = const [],
  });
  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        image,
        category,
        organization,
        redaction,
        isPremium,
        price,
        publishDate,
        tags,
      ];
}
