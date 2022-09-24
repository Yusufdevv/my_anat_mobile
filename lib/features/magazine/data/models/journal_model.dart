import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/magazine/data/models/tag_model.dart';
import 'package:anatomica/features/magazine/domain/entities/journal_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'journal_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JournalModel extends JournalEntity {
  const JournalModel({
    required super.tags,
    required super.publishDate,
    required super.isPremium,
    required super.category,
    required super.price,
    required super.organization,
    required super.image,
    required super.description,
    required super.slug,
    required super.name,
    required super.id,
    required super.redaction,
    required super.isBought,
    required super.fileExtension,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json) => _$JournalModelFromJson(json);
}
