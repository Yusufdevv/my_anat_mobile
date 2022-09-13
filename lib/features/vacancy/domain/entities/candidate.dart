import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CandidateListEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String fullName;
  @ImageConverter()
  final ImageEntity image;
  @SpecializationConverter()
  final SpecializationEntity specialization;
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
  @JsonKey(defaultValue: false)
  final bool isFavorite;

  const CandidateListEntity({
    this.specialization = const SpecializationEntity(),
    this.phoneNumber = '',
    this.address = '',
    this.id = 0,
    this.rating = 0,
    this.image = const ImageEntity(),
    this.fullName = '',
    this.position = '',
    this.workExperience = 0,
    this.isFavorite = false,
  });

  CandidateListEntity copyWith({
    int? id,
    String? fullName,
    ImageEntity? image,
    SpecializationEntity? specialization,
    String? position,
    String? phoneNumber,
    int? workExperience,
    String? address,
    double? rating,
    bool? isFavorite,
  }) =>
      CandidateListEntity(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        image: image ?? this.image,
        specialization: specialization ?? this.specialization,
        position: position ?? this.position,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        workExperience: workExperience ?? this.workExperience,
        address: address ?? this.address,
        rating: rating ?? this.rating,
        isFavorite: isFavorite ?? this.isFavorite,
      );

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
        isFavorite,
      ];
}
