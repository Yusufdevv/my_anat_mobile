import 'package:anatomica/features/vacancy/data/models/cadidate_education_files_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CandidateEducationFilesEntity extends Equatable {
  const CandidateEducationFilesEntity({
    this.id = -1,
    this.document = const DocumentFilesEntity(),
  });

  final int id;
  @DocumentFilesEntityConverter()
  final DocumentFilesEntity document;

  @override
  List<Object?> get props => [id, document];
}

class DocumentFilesEntity extends Equatable {
  const DocumentFilesEntity({
    this.name = '',
    this.url = '',
    this.size = 0,
  });

  final String name;
  final String url;
  final int size;

  @override
  List<Object?> get props => [name, url, size];
}

class DocumentFilesEntityConverter
    extends JsonConverter<DocumentFilesEntity, Map<String, dynamic>?> {
  const DocumentFilesEntityConverter();

  @override
  DocumentFilesEntity fromJson(Map<String, dynamic>? json) =>
      DocumentFilesModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DocumentFilesEntity object) => {};
}
