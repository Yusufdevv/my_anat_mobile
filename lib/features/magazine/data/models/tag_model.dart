import 'package:anatomica/features/magazine/domain/entities/tag_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag_model.g.dart';

@JsonSerializable()
class TagModel extends TagEntity {
  const TagModel({required super.title, required super.id});
  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);
}

class TagConverter implements JsonConverter<TagEntity, Map<String, dynamic>?> {
  const TagConverter();
  @override
  TagEntity fromJson(Map<String, dynamic>? json) => TagModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(TagEntity object) => {};
}
