import 'package:anatomica/features/auth/domain/entities/diplom_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diplom_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DiplomModel extends DiplomEntity {
  const DiplomModel({required super.url, required super.size});

  factory DiplomModel.fromJson(Map<String, dynamic> json) => _$DiplomModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiplomModelToJson(this);
}

class DiplomConverter implements JsonConverter<DiplomEntity, Map<String, dynamic>?> {
  const DiplomConverter();

  @override
  DiplomEntity fromJson(Map<String, dynamic>? json) => DiplomModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(DiplomEntity object) => {};
}
