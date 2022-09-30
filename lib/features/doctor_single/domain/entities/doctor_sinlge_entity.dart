import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/organization_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/organization_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:equatable/equatable.dart';

class DoctorSingleEntity extends Equatable {
  final int id;
  final String fullName;
  @PositionEntityConverter()
  final PositionEntity position;
  final int workExperience;
  final String work;
  @RegionConverter()
  final RegionEntity region;
  @DistrictConverter()
  final DistrictEntity district;
  final String address;
  @SpecializationConverter()
  final SpecializationEntity specialization;
  final String phoneNumber;
  final String email;
  final double rating;
  final bool openToWork;
  final String bio;
  final bool showInProfileBio;
  @LicenceEntityConverter()
  final LicenceEntity licence;
  final String instagram;
  final String telegram;
  final String moderationStatus;
  @ImageConverter()
  final ImageEntity img;
  final int commentCount;
  @OrganizationConverter()
  final OrganizationEntity organization;
  const DoctorSingleEntity(
      {this.id = 0,
      this.fullName = '',
      this.position = const PositionEntity(),
      this.workExperience = 0,
      this.work = '',
      this.region = const RegionEntity(),
      this.district = const DistrictEntity(),
      this.address = '',
      this.specialization = const SpecializationEntity(),
      this.phoneNumber = '',
      this.email = '',
      this.rating = 0,
      this.openToWork = false,
      this.bio = '',
      this.showInProfileBio = false,
      this.licence = const LicenceEntity(),
      this.instagram = '',
      this.telegram = '',
      this.moderationStatus = '',
      this.img = const ImageEntity(),
      this.commentCount = 0,
      this.organization = const OrganizationEntity()});

  @override
  List<Object?> get props => [
        id,
        fullName,
        position,
        workExperience,
        work,
        region,
        district,
        address,
        specialization,
        phoneNumber,
        email,
        rating,
        openToWork,
        bio,
        showInProfileBio,
        licence,
        instagram,
        telegram,
        moderationStatus,
        img,
        organization,
      ];
}
