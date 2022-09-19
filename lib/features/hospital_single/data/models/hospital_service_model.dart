import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital_service_model.g.dart';

@JsonSerializable()
class HospitalServiceModel extends HospitalServiceEntity {
  const HospitalServiceModel({
    required super.id,
    required super.name,
    required super.url,
  });
  factory HospitalServiceModel.fromJson(Map<String, dynamic> json) => _$HospitalServiceModelFromJson(json);
}
