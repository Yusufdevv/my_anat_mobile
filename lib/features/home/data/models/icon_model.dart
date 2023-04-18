
import 'package:anatomica/features/home/domain/entities/file_entity.dart';
import 'package:anatomica/features/home/domain/entities/icon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'icon_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IconModel extends IconEntity {
  const IconModel({ 
    required super.file,
    required super.title,
    required super.id,
  });

  factory IconModel.fromJson(Map<String, dynamic> json) => _$IconModelFromJson(json); 
}
