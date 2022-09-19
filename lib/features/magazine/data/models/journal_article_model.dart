import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'journal_article_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JournalArticleModel extends JournalArticleEntity {
  const JournalArticleModel({
    required super.viewCount,
    required super.title,
    required super.isPremium,
    required super.category,
    required super.slug,
    required super.publishDate,
    required super.image,
    required super.redaction,
    required super.id,
    required super.isBought,
    required super.moderationStatus,
    required super.isPaidForPublish,
  });
  factory JournalArticleModel.fromJson(Map<String, dynamic> json) => _$JournalArticleModelFromJson(json);
}
