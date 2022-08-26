import 'package:anatomica/features/common/models/phone_number.dart';
import 'package:anatomica/features/common/models/titler.dart';
import 'package:anatomica/features/vacancy/data/models/top_organization.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization_model.g.dart';


@JsonSerializable()
class OrganizationModel {
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
  final int rating;
  @JsonKey(name: 'location_url', defaultValue: '')
  final String locationUrl;
  @JsonKey(name: 'logo', )
  final LogoModel logo;
  @JsonKey(name: 'phone_numbers', defaultValue: [])
  final List<PhoneNumberModel> phoneNumbers;
  @JsonKey(name: 'specialization', defaultValue: [])
  final List<TitlerModel> specialization;
  @JsonKey(name: 'types', defaultValue:[])
  final List<TitlerModel> types;

  OrganizationModel(
      {required this.id, required this.title, required this.logo, required this.types, required this.slug, required this.address, required this.phoneNumber, required this.locationUrl, required this.phoneNumbers, required this.rating, required this.specialization});


factory OrganizationModel.fromJson(Map<String,dynamic> json )=>_$OrganizationModelFromJson(json);
}