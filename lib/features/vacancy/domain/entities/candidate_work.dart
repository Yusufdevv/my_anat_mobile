import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/vacancy/data/models/candidate_work.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CandidateWorkEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @CandidateOrganizationConverter()
  final CandidateOrganization organization;
  @JsonKey(defaultValue: '')
  final String position;
  @JsonKey(defaultValue: '')
  final String startDate;
  @JsonKey(defaultValue: '')
  final String endDate;
  @JsonKey(defaultValue: false)
  final bool isMain;

  const CandidateWorkEntity({
    required this.organization,
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.position,
    required this.isMain,
  });

  @override
  List<Object?> get props => [
        organization,
        id,
        startDate,
        endDate,
        position,
        isMain,
      ];
}

class CandidateOrganization extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String slug;
  @JsonKey(defaultValue: '')
  final String logo;
  @JsonKey(defaultValue: [])
  final List<ImageModel> images;
  @JsonKey(defaultValue: '')
  final String address;
  @JsonKey(defaultValue: [])
  final List<PhoneNumberModel> phoneNumbers;
  @JsonKey(defaultValue: 0)
  final double rating;
  @JsonKey(defaultValue: [])
  final List<SpecializationModel> specialization;
  @JsonKey(defaultValue: [])
  final List<TypeModel> types;
  @JsonKey(defaultValue: '')
  final String locationUrl;
  @JsonKey(defaultValue: false)
  final bool workAllDay;

  const CandidateOrganization(
      {required this.id,
      required this.title,
      required this.logo,
      required this.slug,
      required this.address,
      required this.rating,
      required this.specialization,
      required this.phoneNumbers,
      required this.types,
      required this.locationUrl,
      required this.images,
      required this.workAllDay});
  @override
  List<Object?> get props =>
      [id, title, logo, slug, address, rating, specialization, phoneNumbers, types, locationUrl, images, workAllDay];
}

class CandidateOrganizationConverter implements JsonConverter<CandidateOrganization, Map<String, dynamic>?> {
  const CandidateOrganizationConverter();

  @override
  CandidateOrganization fromJson(Map<String, dynamic>? json) => CandidateOrganizationModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CandidateOrganization object) => {};
}
