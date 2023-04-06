import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/home/domain/entities/news_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsModel extends NewsEntity {
  const NewsModel({
    required super.title,
    required super.slug,
    required super.publishDate,
    required super.image,
    required super.id,
    required super.description,
    required super.viewCount,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
