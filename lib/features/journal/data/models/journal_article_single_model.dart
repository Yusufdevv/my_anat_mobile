import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/journal/domain/entities/journal_article_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'journal_article_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JournalArticleSingleModel extends JournalArticleSingleEntity {
  const JournalArticleSingleModel({
    required super.shortDescription,
    required super.journal,
    required super.price,
    required super.organization,
    required super.description,
    required super.viewCount,
    required super.isPremium,
    required super.category,
    required super.publishDate,
    required super.redaction,
    required super.id,
    required super.image,
    required super.title,
    required super.slug,
  });
  factory JournalArticleSingleModel.fromJson(Map<String, dynamic> json) => _$JournalArticleSingleModelFromJson(json);
}
