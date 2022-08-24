import 'package:anatomica/features/profile/domain/entities/region_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'region.g.dart';

@JsonSerializable(createToJson: false)
class RegionModel extends RegionEntity {
  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  const RegionModel({
    required int id,
    required String title,
    required String soato,
  }) : super(id: id, title: title, soato: soato);

  factory RegionModel.empty() {
    return const RegionModel(
      id: 0,
      title: '',
      soato: '',
    );
  }

  @override
  String toString() {
    return 'RegionModel(id: $id,title: $title,soato: $soato)';
  }
}
