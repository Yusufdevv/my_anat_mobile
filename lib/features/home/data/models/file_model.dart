

import 'package:anatomica/features/home/domain/entities/file_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FileModel extends FileEntity {
  const FileModel({ 
    required super.url,
    required super.size, 
  });

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json); 
}
