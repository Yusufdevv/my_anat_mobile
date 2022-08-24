import 'package:anatomica/features/profile/domain/entities/district_entity.dart';
import 'package:anatomica/features/profile/domain/entities/image_entity.dart';
import 'package:anatomica/features/profile/domain/entities/license_entity.dart';
import 'package:anatomica/features/profile/domain/entities/region_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DoctorEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'full_name', defaultValue: '')
  final String fullName;
  @JsonKey(name: 'position', defaultValue: '')
  final String position;
  @JsonKey(name: 'work_experience', defaultValue: 0)
  final int workExperience;
  @JsonKey(name: 'work', defaultValue: '')
  final String work;
  @JsonKey(name: 'region')
  final RegionEntity? region;
  @JsonKey(name: 'district')
  final DistrictEntity? district;
  @JsonKey(name: 'address', defaultValue: '')
  final String address;
  @JsonKey(name: 'specialization', defaultValue: '')
  final String specialization;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'rating', defaultValue: 0)
  final int rating;
  @JsonKey(name: 'open_to_work', defaultValue: false)
  final bool openToWork;
  @JsonKey(name: 'bio', defaultValue: '')
  final String bio;
  @JsonKey(name: 'show_in_profile_bio', defaultValue: false)
  final bool showInProfileBio;
  @JsonKey(name: 'license')
  final LicenseEntity? license;
  @JsonKey(name: 'instagram', defaultValue: '')
  final String instagram;
  @JsonKey(name: 'telegram', defaultValue: '')
  final String telegram;
  @JsonKey(name: 'moderation_status', defaultValue: '')
  final String moderationStatus;
  @JsonKey(name: 'img', defaultValue: null)
  final ImageEntity? img;

  const DoctorEntity({
    required this.id,
    required this.fullName,
    required this.position,
    required this.workExperience,
    required this.work,
    required this.region,
    required this.district,
    required this.address,
    required this.specialization,
    required this.phoneNumber,
    required this.email,
    required this.rating,
    required this.openToWork,
    required this.bio,
    required this.showInProfileBio,
    required this.license,
    required this.instagram,
    required this.telegram,
    required this.moderationStatus,
    required this.img,
  });

  factory DoctorEntity.empty() => DoctorEntity(
      id: 0,
      fullName: '',
      position: '',
      workExperience: 0,
      work: '',
      region: RegionEntity.empty(),
      district: DistrictEntity.empty(),
      address: '',
      specialization: '',
      phoneNumber: '',
      email: '',
      rating: 0,
      openToWork: false,
      bio: '',
      showInProfileBio: false,
      license: LicenseEntity.empty(),
      instagram: '',
      telegram: '',
      moderationStatus: '',
      img: ImageEntity.empty());

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

  DoctorEntity copyWith({
    int? id,
    String? fullName,
    String? position,
    int? workExperience,
    String? work,
    RegionEntity? region,
    DistrictEntity? district,
    String? address,
    String? specialization,
    String? phoneNumber,
    String? email,
    int? rating,
    bool? openToWork,
    String? bio,
    bool? showInProfileBio,
    LicenseEntity? license,
    String? instagram,
    String? telegram,
    String? moderationStatus,
    ImageEntity? img,
  }) =>
      DoctorEntity(
          id: id ?? this.id,
          fullName: fullName ?? this.fullName,
          position: position ?? this.position,
          workExperience: workExperience ?? this.workExperience,
          work: work ?? this.work,
          region: region ?? this.region,
          district: district ?? this.district,
          address: address ?? this.address,
          specialization: specialization ?? this.specialization,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          email: email ?? this.email,
          rating: rating ?? this.rating,
          openToWork: openToWork ?? this.openToWork,
          bio: bio ?? this.bio,
          showInProfileBio: showInProfileBio ?? this.showInProfileBio,
          license: license ?? this.license,
          instagram: instagram ?? this.instagram,
          telegram: telegram ?? this.telegram,
          moderationStatus: moderationStatus ?? this.moderationStatus,
          img: img ?? this.img);
}
