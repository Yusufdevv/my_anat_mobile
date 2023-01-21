import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/logo.dart';
import 'package:anatomica/features/common/data/models/phone_number.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:anatomica/features/map/domain/entities/hospital_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization_model.g.dart';

@JsonSerializable()
class HospitalModel extends HospitalEntity {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @JsonKey(name: 'address', defaultValue: '')
  final String address;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @JsonKey(name: 'rating', defaultValue: 0)
  final double rating;
  @JsonKey(name: 'location_url', defaultValue: '')
  final String locationUrl;
  @JsonKey(name: 'phone_numbers', defaultValue: [])
  final List<PhoneNumberModel> phoneNumbers;
  @JsonKey(name: 'images', defaultValue: [])
  final List<AssetModel> imagesList;
  @JsonKey(name: 'specialization', defaultValue: [])
  final List<TitlerModel> specialization;
  @JsonKey(name: 'types', defaultValue: [])
  final List<TitlerModel> types;
  final String inn;
  final bool workAllDay;
  final double latitude;
  final double longitude;

  HospitalModel({
    required this.id,
    required this.imagesList,
    required this.title,
    required super.logo,
    required this.types,
    required this.slug,
    required this.address,
    required this.phoneNumber,
    required this.locationUrl,
    required this.phoneNumbers,
    required this.rating,
    required this.specialization,
    this.longitude = -1,
    this.latitude = -1,
    this.inn = '',
    this.workAllDay = false,
  }) : super(
            title: title,
            address: address,
            images: imagesList,
            rating: rating,
            slug: slug,
            id: id,
            longitude: longitude,
            latitude: latitude,
            inn: inn,
            locationUrl: locationUrl,
            workAllDay: workAllDay,
            phoneNumber: phoneNumber);

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalModelFromJson(json);
}
