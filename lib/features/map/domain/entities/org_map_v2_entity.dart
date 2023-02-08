import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:equatable/equatable.dart';

class OrgMapV2Entity extends Equatable {
  const OrgMapV2Entity({
    this.id = -1,
    this.title = '',
    this.slug = '',
    this.images = const [],
    this.logo = const LogoEntity(),
    this.inn = '',
    this.workFrom = '',
    this.workTo = '',
    this.longitude = 0,
    this.latitude = 0,
    this.region = const RegionEntity(),
    this.district = const DistrictEntity(),
    this.address = '',
    this.rating = 0,
    this.specialization = const [],
    this.types = const [],
    this.phoneNumber = '',
    this.distance = 0,
    this.workAllDay = false,
  });

  final int id;
  final String title;
  final String slug;
  @LogoEntityConverter()
  final List<LogoEntity> images;
  @LogoEntityConverter()
  final LogoEntity logo;
  final String inn;
  final String workFrom;
  final String workTo;
  final double longitude;
  final double latitude;
  @RegionConverter()
  final RegionEntity region;
  @DistrictConverter()
  final DistrictEntity district;
  final String address;
  final double rating;
  @SpecializationConverter()
  final List<SpecializationEntity> specialization;
  @SpecializationConverter()
  final List<SpecializationEntity> types;
  final String phoneNumber;
  final double distance;
  final bool workAllDay;

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        images,
        logo,
        inn,
        workFrom,
        workTo,
        longitude,
        latitude,
        region,
        district,
        address,
        rating,
        specialization,
        types,
        phoneNumber,
        distance,
        workAllDay,
      ];
}
