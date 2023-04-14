import 'package:anatomica/features/auth/data/models/diplom_model.dart';
import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/organization_model.dart';
import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/diplom_entity.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/organization_entity.dart';
import 'package:anatomica/features/auth/domain/entities/phone_number_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:equatable/equatable.dart';

class DoctorSingleEntity extends Equatable {
  final int id;
  final String fullName;
  final String doctorName;
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
  final List<SpecializationEntity> specializations;
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
  @ImageConverter()
  final List<ImageEntity> images;
  final int commentCount;
  @OrganizationConverter()
  final OrganizationEntity organization;
  @OrganizationConverter()
  final List<OrganizationEntity> organizations;
  @PhoneNumberConverter()
  final List<PhoneNumberEntity> phoneNumbers;
  final bool imgIsFull;
  final double latitude;
  final double longitude;
  @DiplomConverter()
  final DiplomEntity diplom;
  final bool paid;
  final String organizationName;

  const DoctorSingleEntity({
    this.id = 0,
    this.fullName = '',
    this.doctorName = '',
    this.images = const [],
    this.position = const PositionEntity(),
    this.workExperience = 0,
    this.work = '',
    this.region = const RegionEntity(),
    this.district = const DistrictEntity(),
    this.address = '',
    this.organizations = const [],
    this.specializations = const [],
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
    this.phoneNumbers = const [],
    this.organization = const OrganizationEntity(),
    this.imgIsFull = false,
    this.latitude = 0,
    this.longitude = 0,
    this.diplom =const DiplomEntity(),
    this.paid = false,
    this.organizationName = '',
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        doctorName,
        position,
        workExperience,
        work,
        imgIsFull,
        latitude,
        longitude,
        diplom,
        paid,
        organizationName,
        region,
        district,
        address,
        specializations,
        phoneNumber,
        organizations,
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
        phoneNumbers,
        images,
      ];
}
