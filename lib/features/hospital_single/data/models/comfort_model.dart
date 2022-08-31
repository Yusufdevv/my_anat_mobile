import 'package:anatomica/features/common/models/logo.dart';
import 'package:anatomica/features/hospital_single/data/models/file.dart';
import 'package:anatomica/features/hospital_single/data/models/icon.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comfort_model.g.dart';

@JsonSerializable()
class ComfortModel extends ComfortEntity {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(
    name: 'icon',
  )
  final IconModel? iconModel;

  ComfortModel({required this.id, required this.name, required this.iconModel})
      : super(
      icon: iconModel != null ? iconModel.file.url:'',
      id: id,
      text: name);

  factory ComfortModel.fromJson(Map<String, dynamic> json) {
    return _$ComfortModelFromJson(json);
  }
}
