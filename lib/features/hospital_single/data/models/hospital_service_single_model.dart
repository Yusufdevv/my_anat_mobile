import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_single.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_service_single_model.g.dart';

@JsonSerializable()
class HospitalSingleServiceModel extends HospitalServiceSingleEntity {
  const HospitalSingleServiceModel({
    required super.url,
    required super.image,
    required super.content,
    required super.name,
    required super.id,
  });
  factory HospitalSingleServiceModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalSingleServiceModelFromJson(json);
}
