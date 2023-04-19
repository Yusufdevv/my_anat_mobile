import 'package:anatomica/features/home/data/models/icon_model.dart';
import 'package:anatomica/features/home/domain/entities/file_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class IconEntity extends Equatable {
  const IconEntity({
    this.id = 0,
    this.title = '',
    this.file = const FileEntity(),
  });

  final int id;
  final String title;
  @FileConverter()
  final FileEntity file; 

  @override
  List<Object?> get props => [id, title, file];
}

class IconConverter implements JsonConverter<IconEntity, Map<String, dynamic>?> {
  const IconConverter();
  @override
  IconEntity fromJson(Map<String, dynamic>? json) => IconModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(IconEntity object) => {};
}
