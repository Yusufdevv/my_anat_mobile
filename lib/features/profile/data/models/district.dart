import 'package:anatomica/features/profile/data/models/region.dart';
import 'package:anatomica/features/profile/domain/entities/district_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.g.dart';

@JsonSerializable(createToJson: false)
class DistrictModel extends DistrictEntity {
  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  const DistrictModel({
    required int id,
    required String title,
    required String soato,
    required RegionModel? region,
  }) : super(id: id, title: title, soato: soato, region: region);

  factory DistrictModel.empty() {
    return DistrictModel(
        id: 0, title: '', soato: '', region: RegionModel.empty());
  }

  @override
  String toString() {
    return 'DistrictModel(id: $id,title: $title,soato: $soato,region: $region)';
  }
}
