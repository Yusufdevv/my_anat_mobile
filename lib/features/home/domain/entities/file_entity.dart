import 'package:anatomica/features/home/data/models/file_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class FileEntity extends Equatable {
  const FileEntity({
    this.url = '',
    this.size = 0,
  });

  final String url;
  final int size;

  @override
  List<Object?> get props => [url, size];
}

class FileConverter implements JsonConverter<FileEntity, Map<String, dynamic>?> {
  const FileConverter();
  @override
  FileEntity fromJson(Map<String, dynamic>? json) => FileModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(FileEntity object) => {};
}
