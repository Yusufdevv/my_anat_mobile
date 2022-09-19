import 'package:anatomica/features/hospital_single/domain/entities/hospital_certificate_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_certificate_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HospitalCertificateModel extends HospitalCertificateEntity {
  const HospitalCertificateModel({required super.url, required super.size});
  factory HospitalCertificateModel.fromJson(Map<String, dynamic> json) => _$HospitalCertificateModelFromJson(json);
}
