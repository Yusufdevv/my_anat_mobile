import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final int id;
  final String title;
  final String slug;
  @ImageConverter()
  final ImageEntity image;
  final String publishDate;
  final String description;
  final int viewCount;

  const NewsEntity({
    this.image = const ImageEntity(),
    this.publishDate = '',
    this.id = 0,
    this.slug = '',
    this.title = '',
    this.viewCount = 0,
    this.description = '',
  });

  @override
  List<Object?> get props => [
        image,
        publishDate,
        id,
        slug,
        title,
        viewCount,
        description,
      ];
}
