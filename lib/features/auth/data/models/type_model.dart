import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TypeModel extends TypeEntity {
  const TypeModel({required super.title, required super.id});

  factory TypeModel.fromJson(Map<String, dynamic> json) => _$TypeModelFromJson(json);
}

class TypeConverter implements JsonConverter<TypeEntity, Map<String, dynamic>?> {
  const TypeConverter();
  @override
  TypeEntity fromJson(Map<String, dynamic>? json) => TypeModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(TypeEntity object) => {};
}
