import 'package:anatomica/features/hospital_single/data/models/hospital_certificate_model.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class HospitalCertificateEntity extends Equatable {
  final String url;
  final int size;
  const HospitalCertificateEntity({this.size = 0, this.url = ''});

  @override
  List<Object?> get props => [url, size];
}

class HospitalCertificateConverter implements JsonConverter<HospitalCertificateEntity, Map<String, dynamic>?> {
  const HospitalCertificateConverter();
  @override
  HospitalCertificateEntity fromJson(Map<String, dynamic>? json) => HospitalCertificateModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(HospitalCertificateEntity object) => {};
}
