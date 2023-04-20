import 'package:anatomica/features/map/domain/entities/id_name_url_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'id_name_url_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class IdNameUrlModel extends IdNameUrlEntity {
  const IdNameUrlModel({
    required super.id,
    required super.name,
    required super.url,
  });
  factory IdNameUrlModel.fromJson(Map<String, dynamic> json) => _$IdNameUrlModelFromJson(json);
}
