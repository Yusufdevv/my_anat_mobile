import 'package:anatomica/features/hospital_single/domain/entities/file_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_model.g.dart';

@JsonSerializable()
class FileModel extends FileEntity {
  FileModel({
    required super.url,
    required super.size,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) => _$FileModelFromJson(json);
}

class FileConverter implements JsonConverter<FileEntity, Map<String, dynamic>?> {
  const FileConverter();
  @override
  FileEntity fromJson(Map<String, dynamic>? json) => FileModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(FileEntity object) => {};
}
