import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/map/domain/entities/id_name_url_entity.dart';
import 'package:anatomica/features/map/domain/entities/service_or_specialization_entity.dart';
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
    this.paid = false,
    this.subscribeFrom = '',
    this.subscribeUpto = '',
    this.service = const <IdNameUrlEntity>[],
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
  @IdNameUrlConverter()
  final List<IdNameUrlEntity> service;
  final String phoneNumber;
  final double distance;
  final bool workAllDay;
  final String subscribeFrom;
  final String subscribeUpto;
  final bool paid;

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
        paid,
        subscribeFrom,
        subscribeUpto,
        service,
      ];
}

extension OrgMapV2EntityExtention on OrgMapV2Entity {
  List<ServiceOrSpecializationEntity> getServiceOrSpecialization({required String? pattern, bool unUsed = false}) {
    if (pattern != null && pattern.isEmpty) return [];
    final v = [
      ...specialization.map((e) => ServiceOrSpecializationEntity(isService: false, id: e.id, title: e.title)).toList(),
      ...service.map((e) => ServiceOrSpecializationEntity(isService: false, id: e.id, title: e.name)).toList()
    ];
    if (pattern == null) return v;
    return v.where((element) => element.title.toLowerCase().contains(pattern.toLowerCase())).toList();
  }
}
