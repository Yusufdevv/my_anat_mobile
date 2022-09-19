import 'package:anatomica/features/hospital_single/data/models/icon_model.dart';
import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/icon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comfort_model.g.dart';

@JsonSerializable()
class ComfortModel extends ComfortEntity {
  ComfortModel({
    required super.id,
    required super.name,
    required super.icon,
  });

  factory ComfortModel.fromJson(Map<String, dynamic> json) {
    return _$ComfortModelFromJson(json);
  }
}
