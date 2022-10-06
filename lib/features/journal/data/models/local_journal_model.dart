import 'package:anatomica/features/journal/domain/entities/local_journal_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_journal_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LocalJournalModel extends LocalJournalEntity {
  const LocalJournalModel({required super.imageUrl, required super.journalId, required super.redaction});
  factory LocalJournalModel.fromJson(Map<String, dynamic> json) => _$LocalJournalModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalJournalModelToJson(this);
}
