import 'package:anatomica/features/vacancy/domain/entities/district.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DistrictModel extends DistrictEntity {
  const DistrictModel({
    required super.region,
    required super.soato,
    required super.title,
    required super.id,
    required super.isCheck,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => _$DistrictModelFromJson(json);
}
