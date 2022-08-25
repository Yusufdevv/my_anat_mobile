import 'package:anatomica/features/vacancy/data/models/region.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DistrictEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String soato;
  @RegionEntityConverter()
  final RegionEntity region;

  DistrictEntity({
    required this.region,
    required this.soato,
    required this.title,
    required this.id,

  });


  @override
  List<Object?> get props => [id, title, soato, region];
}
