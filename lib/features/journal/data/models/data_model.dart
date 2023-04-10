import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/journal/domain/entities/data_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DataModel extends DataEntity {
  const DataModel({
    required super.isPremium,
    required super.category,
    required super.slug,
    required super.publishDate,
    required super.image,
    required super.redaction,
    required super.id,
    required super.author,
    required super.description,
    required super.isActive,
    required super.languageRu,
    required super.languageUz,
    required super.name,
    required super.organization,
    required super.price,
    required super.tags,
    required super.uzumLink,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
