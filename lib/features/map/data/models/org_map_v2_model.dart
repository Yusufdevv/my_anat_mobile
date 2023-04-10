import 'package:anatomica/features/auth/data/models/district_model.dart';
import 'package:anatomica/features/auth/data/models/region_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/district_entity.dart';
import 'package:anatomica/features/auth/domain/entities/region_entity.dart';
import 'package:anatomica/features/map/domain/entities/org_map_v2_entity.dart';
import 'package:anatomica/features/vacancy/domain/entities/top_organization.dart';
import 'package:json_annotation/json_annotation.dart';

part 'org_map_v2_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrgMapV2Model extends OrgMapV2Entity {
  const OrgMapV2Model({
    required super.workAllDay,
    required super.id,
    required super.phoneNumber,
    required super.distance,
    required super.types,
    required super.specialization,
    required super.district,
    required super.rating,
    required super.address,
    required super.region,
    required super.latitude,
    required super.longitude,
    required super.workTo,
    required super.workFrom,
    required super.title,
    required super.inn,
    required super.logo,
    required super.images,
    required super.slug,
    required super.paid,
    required super.subscribeFrom,
    required super.subscribeUpto,
  });

  factory OrgMapV2Model.fromJson(Map<String, dynamic> json) =>
      _$OrgMapV2ModelFromJson(json);
}

class OrgMapV2ModelConverter
    implements JsonConverter<OrgMapV2Entity, Map<String, dynamic>?> {
  const OrgMapV2ModelConverter();
  @override
  OrgMapV2Entity fromJson(Map<String, dynamic>? json) =>
      OrgMapV2Model.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(OrgMapV2Entity object) => {};
}
