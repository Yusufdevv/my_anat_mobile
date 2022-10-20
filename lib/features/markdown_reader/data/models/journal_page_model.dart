import 'package:anatomica/features/markdown_reader/domain/entities/journal_page_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_page_model.g.dart';

@JsonSerializable()
class JournalPageModel extends JournalPageEntity {
  const JournalPageModel({
    required super.journal,
    required super.preview,
    required super.page,
    required super.content,
  });
  factory JournalPageModel.fromJson(Map<String, dynamic> json) => _$JournalPageModelFromJson(json);
}
