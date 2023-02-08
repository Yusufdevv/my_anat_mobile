import 'package:anatomica/features/map/data/models/doctor_spec.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_doctor.g.dart';

@JsonSerializable()
class MapDoctorModel {
  @DoctorSpecConverter()
  final DoctorSpecModel doctor;

  MapDoctorModel({required this.doctor});

  factory MapDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$MapDoctorModelFromJson(json);
}
