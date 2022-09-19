import 'package:anatomica/features/hospital_single/data/models/file_model.dart';
import 'package:anatomica/features/hospital_single/domain/entities/file_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/icon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'icon_model.g.dart';

@JsonSerializable()
class IconModel extends IconEntity {
  IconModel({
    required super.title,
    required super.slug,
    required super.id,
    required super.file,
  });

  factory IconModel.fromJson(Map<String, dynamic> json) => _$IconModelFromJson(json);
}

class IconConverter implements JsonConverter<IconEntity, Map<String, dynamic>?> {
  const IconConverter();
  @override
  IconEntity fromJson(Map<String, dynamic>? json) => IconModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(IconEntity object) => {};
}
