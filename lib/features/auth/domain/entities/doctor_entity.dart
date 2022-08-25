import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/data/models/license_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/license_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class DoctorEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String fullName;
  @JsonKey(defaultValue: '')
  final String position;
  @JsonKey(defaultValue: 0)
  final int workExperience;
  @JsonKey(defaultValue: '')
  final String work;
  @RegionConverter()
  final RegionEntity region;
  @DistrictConverter()
  final DistrictEntity district;
  @JsonKey(defaultValue: '')
  final String address;
  @JsonKey(defaultValue: '')
  final String specialization;
  @JsonKey(defaultValue: '')
  final String phoneNumber;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: 0)
  final double rating;
  @JsonKey(defaultValue: false)
  final bool openToWork;
  @JsonKey(defaultValue: '')
  final String bio;
  @JsonKey(defaultValue: false)
  final bool showInProfileBio;
  @LicenseConverter()
  final LicenseEntity license;
  @JsonKey(defaultValue: '')
  final String instagram;
  @JsonKey(defaultValue: '')
  final String telegram;
  @JsonKey(defaultValue: '')
  final String moderationStatus;
  @ImageConverter()
  final ImageEntity img;
  const DoctorEntity({
    this.region = const RegionEntity(),
    this.id = 0,
    this.telegram = '',
    this.instagram = '',
    this.rating = 0,
    this.position = '',
    this.address = '',
    this.bio = '',
    this.district = const DistrictEntity(),
    this.email = '',
    this.fullName = '',
    this.img = const ImageEntity(),
    this.license = const LicenseEntity(),
    this.moderationStatus = '',
    this.openToWork = false,
    this.phoneNumber = '',
    this.showInProfileBio = false,
    this.specialization = '',
    this.work = '',
    this.workExperience = 0,
  });
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
        license,
        instagram,
        telegram,
        moderationStatus,
        img,
      ];
}
