import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_special_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital_service_special_model.g.dart';

@JsonSerializable()
class HospitalServiceSpecialModel extends HospitalServiceSpecialEntity {
  const HospitalServiceSpecialModel({
    required super.id,
    required super.title,
  });

  factory HospitalServiceSpecialModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalServiceSpecialModelFromJson(json);
}
