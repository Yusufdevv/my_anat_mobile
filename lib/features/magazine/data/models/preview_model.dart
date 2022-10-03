import 'package:anatomica/features/magazine/domain/entities/preview_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PreviewModel extends PreviewEntity {
  const PreviewModel({
    required super.url,
    required super.size,
  });
  factory PreviewModel.fromJson(Map<String, dynamic> json) => _$PreviewModelFromJson(json);
}
