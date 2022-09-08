import 'package:anatomica/features/map/data/models/doctors_model.dart';
import 'package:anatomica/features/map/data/models/map_hospital.dart';
import 'package:anatomica/features/map/data/models/organization_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'map_doctor.g.dart';

@JsonSerializable()
class MapDoctorModel {
  final DoctorsModel doctor ;
  final MapHospitalModel hospital;
  MapDoctorModel({required this.hospital,required this.doctor});

  factory MapDoctorModel.fromJson(Map<String,dynamic> json)=>_$MapDoctorModelFromJson(json);
}