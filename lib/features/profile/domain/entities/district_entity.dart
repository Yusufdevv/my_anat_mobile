import 'package:anatomica/features/profile/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DistrictEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'soato', defaultValue: '')
  final String soato;
  @JsonKey(name: 'region')
  final RegionEntity? region;

  const DistrictEntity({
    required this.id,
    required this.title,
    required this.soato,
    required this.region,
  });

  factory DistrictEntity.empty() =>
      DistrictEntity(id: 0, title: '', soato: '', region: RegionEntity.empty());

  @override
  List<Object?> get props => [id, title, soato, region];

  DistrictEntity copyWith({
    int? id,
    String? title,
    String? soato,
    RegionEntity? region,
  }) =>
      DistrictEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        soato: soato ?? this.soato,
        region: region ?? this.region,
      );
}
