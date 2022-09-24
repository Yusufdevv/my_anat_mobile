import 'package:anatomica/features/map/data/models/doctor_spec.dart';
import 'package:anatomica/features/map/data/models/hospital_doctors_model.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_doctor.g.dart';

@JsonSerializable()
class MapDoctorModel {
  @DoctorSpecConverter()
  final DoctorSpecModel doctor;
  @JsonKey(name: 'organization')
  final MapHospitalModel hospital;

  MapDoctorModel({required this.hospital, required this.doctor});

  factory MapDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$MapDoctorModelFromJson(json);
}
