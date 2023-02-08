import 'package:anatomica/features/map/domain/entities/org_map_v2_entity.dart';
import 'package:anatomica/features/map/domain/entities/service_spec_suggest_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_spec_suggest_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ServiceSpecSuggestModel extends ServiceSpecSuggestEntity {
  const ServiceSpecSuggestModel(
      {required super.name, required super.id, required super.type});

  factory ServiceSpecSuggestModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceSpecSuggestModelFromJson(json);
}

class ServiceSpecSuggestModelConverter
    implements JsonConverter<ServiceSpecSuggestEntity, Map<String, dynamic>?> {
  const ServiceSpecSuggestModelConverter();
  @override
  ServiceSpecSuggestEntity fromJson(Map<String, dynamic>? json) =>
      ServiceSpecSuggestModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(ServiceSpecSuggestEntity object) => {};
}
