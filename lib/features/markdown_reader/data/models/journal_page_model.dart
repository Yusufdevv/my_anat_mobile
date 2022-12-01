import 'package:anatomica/features/markdown_reader/domain/entities/journal_page_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_page_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class JournalPageModel extends JournalPageEntity {
  const JournalPageModel({
    required super.journal,
    required super.preview,
    required super.page,
    required super.contentUz,
    required super.contentRu,
    required super.imgContent,
  });
  factory JournalPageModel.fromJson(Map<String, dynamic> json) => _$JournalPageModelFromJson(json);
}
