import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CertificateEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @SpecializationConverter()
  final SpecializationEntity specialization;
  @JsonKey(defaultValue: '')
  final String certificateNumber;
  @JsonKey(defaultValue: '')
  final String date;

  const CertificateEntity({
    required this.id,
    required this.specialization,
    required this.title,
    required this.date,
    required this.certificateNumber,
  });

  @override
  List<Object?> get props => [
        id,
        specialization,
        title,
        date,
        certificateNumber,
      ];
}
