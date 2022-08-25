import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DistrictEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String soato;
  @RegionConverter()
  final RegionEntity region;
  const DistrictEntity({
    this.soato = '',
    this.title = '',
    this.id = 0,
    this.region = const RegionEntity(),
  });
  @override
  List<Object?> get props => [];
}
