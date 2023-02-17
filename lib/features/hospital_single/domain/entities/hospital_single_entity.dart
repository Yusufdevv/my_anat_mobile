import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/phone_number_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_certificate_entity.dart';
import 'package:equatable/equatable.dart';

class HospitalSingleEntity extends Equatable {
  final int id;
  final String title;
  final String slug;
  @ImageConverter()
  final List<ImageEntity> images;
  @ImageConverter()
  final ImageEntity logo;
  @SpecializationConverter()
  final List<SpecializationEntity> specialization;
  final String locationUrl;
  final String phoneNumber;
  @PhoneNumberConverter()
  final List<PhoneNumberEntity> phoneNumbers;
  final String description;
  final String workFrom;
  final String workTo;
  final double latitude;
  final double longitude;
  @HospitalCertificateConverter()
  final HospitalCertificateEntity certificate;
  @RegionConverter()
  final RegionEntity region;
  @DistrictConverter()
  final DistrictEntity district;
  @TypeConverter()
  final List<TypeEntity> types;
  final double rating;
  final int commentCount;
  final String address;
  final String moderationStatus;
  final String email;
  final String website;
  final String instagram;
  final String facebook;
  final String telegram;
  final bool workAllDay;
  final bool paid;
  final String videoLink;
  final String videoDescription;
  final List<String> videos;

  const HospitalSingleEntity({
    this.id = 0,
    this.title = '',
    this.slug = '',
    this.images = const [],
    this.paid = false,
    this.logo = const ImageEntity(),
    this.specialization = const [],
    this.locationUrl = '',
    this.phoneNumber = '',
    this.phoneNumbers = const [],
    this.description = '',
    this.workFrom = '',
    this.workTo = '',
    this.latitude = 0,
    this.longitude = 0,
    this.certificate = const HospitalCertificateEntity(),
    this.region = const RegionEntity(),
    this.district = const DistrictEntity(),
    this.types = const [],
    this.rating = 0,
    this.commentCount = 0,
    this.address = '',
    this.moderationStatus = '',
    this.email = '',
    this.website = '',
    this.instagram = '',
    this.facebook = '',
    this.telegram = '',
    this.videoDescription = '',
    this.videoLink = '',
    this.workAllDay = false,
    this.videos = const [],
  });

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        images,
        logo,
        specialization,
        locationUrl,
        phoneNumber,
        paid,
        phoneNumbers,
        description,
        workFrom,
        workTo,
        latitude,
        longitude,
        certificate,
        region,
        district,
        types,
        rating,
        commentCount,
        address,
        moderationStatus,
        email,
        website,
        instagram,
        facebook,
        telegram,
        workAllDay,
        videos,
      ];
}
