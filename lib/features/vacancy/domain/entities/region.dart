import 'package:anatomica/features/vacancy/data/models/region.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RegionEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String soato;

  const RegionEntity({
    required this.id,
    required this.title,
    required this.soato,
  });

  @override
  List<Object?> get props => [id, title, soato];
}
class RegionEntityConverter extends JsonConverter<RegionEntity, Map<String, dynamic>?> {
  const RegionEntityConverter();

  @override
  RegionEntity fromJson(Map<String, dynamic>? json) => RegionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RegionEntity object) => {};
}

