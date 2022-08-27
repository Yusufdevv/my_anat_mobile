import 'package:anatomica/features/vacancy/data/models/vacancy_list.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CandidateListEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String fullName;
  @ImageEntityConverter()
  final ImageModel image;
  @SpecializationConverter()
  final Specialization specialization;
  @JsonKey(defaultValue: '')
  final String position;
  @JsonKey(defaultValue: '')
  final String phoneNumber;
  @JsonKey(defaultValue: 0)
  final int workExperience;
  @JsonKey(defaultValue: '')
  final String address;
  @JsonKey(defaultValue: 0)
  final double rating;

  const CandidateListEntity({
    required this.specialization,
    required this.phoneNumber,
    required this.address,
    required this.id,
    required this.rating,
    required this.image,
    required this.fullName,
    required this.position,
    required this.workExperience,
  });

  @override
  List<Object?> get props => [
        specialization,
        phoneNumber,
        address,
        id,
        rating,
        image,
        fullName,
        position,
        workExperience,
      ];
}
