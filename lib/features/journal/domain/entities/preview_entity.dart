import 'package:anatomica/features/journal/data/models/preview_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PreviewEntity {
  final String url;
  final int size;
  const PreviewEntity({
    this.url = '',
    this.size = 0,
  });
}

class PreviewEntityConverter implements JsonConverter<PreviewEntity, Map<String, dynamic>?> {
  const PreviewEntityConverter();
  @override
  PreviewEntity fromJson(Map<String, dynamic>? json) => PreviewModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(PreviewEntity object) => {};
}
