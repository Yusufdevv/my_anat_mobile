import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/certificate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'certificate.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CertificateModel extends CertificateEntity {
  const CertificateModel({
    required super.id,
    required super.specialization,
    required super.title,
    required super.date,
    required super.certificateNumber,
    required super.file,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      _$CertificateModelFromJson(json);
}
