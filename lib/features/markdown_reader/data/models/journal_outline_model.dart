import 'package:anatomica/features/markdown_reader/domain/entities/journal_outline_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'journal_outline_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class JournalOutlineModel extends JournalOutlineEntity {
  const JournalOutlineModel({
    required super.readTime,
    required super.page,
    required super.image,
    required super.id,
    required super.author,
    required super.title,
  });

  factory JournalOutlineModel.fromJson(Map<String, dynamic> json) =>
      _$JournalOutlineModelFromJson(json);
}
