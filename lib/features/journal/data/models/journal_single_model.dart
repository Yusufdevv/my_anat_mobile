import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/journal/data/models/tag_model.dart';
import 'package:anatomica/features/journal/domain/entities/journal_single_entity.dart';
import 'package:anatomica/features/journal/domain/entities/preview_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JournalSingleModel extends JournalSingleEntity {
  const JournalSingleModel({
    required super.preview,
    required super.tags,
    required super.publishDate,
    required super.redaction,
    required super.price,
    required super.organizationId,
    required super.isActive,
    required super.name,
    required super.category,
    required super.slug,
    required super.description,
    required super.id,
    required super.isPremium,
    required super.image,
  });
  factory JournalSingleModel.fromJson(Map<String, dynamic> json) => _$JournalSingleModelFromJson(json);
}
