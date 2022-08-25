import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:json_annotation/json_annotation.dart';
part 'region.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RegionModel extends RegionEntity {
  const RegionModel({required super.id, required super.title, required super.soato});

  factory RegionModel.fromJson(Map<String, dynamic> json) => _$RegionModelFromJson(json);
}
