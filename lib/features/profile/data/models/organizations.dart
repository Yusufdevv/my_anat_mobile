import 'package:anatomica/features/profile/data/models/image.dart';
import 'package:anatomica/features/profile/data/models/phone_numbers.dart';
import 'package:anatomica/features/profile/data/models/type.dart';
import 'package:anatomica/features/profile/domain/entities/organization_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organizations.g.dart';

@JsonSerializable(createToJson: false)
class OrganizationsModel extends OrganizationEntity {
  factory OrganizationsModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationsModelFromJson(json);

  const OrganizationsModel({
    required int id,
    required String title,
    required String slug,
    required ImageModel? logo,
    required List<ImageModel> images,
    required String address,
    required String phoneNumber,
    required List<PhoneNumberModel> phoneNumbers,
    required int rating,
    required List<TypeModel> specialization,
    required List<TypeModel> types,
    required String locationUrl,
  }) : super(
            id: id,
            title: title,
            slug: slug,
            logo: logo,
            images: images,
            address: address,
            phoneNumber: phoneNumber,
            phoneNumbers: phoneNumbers,
            rating: rating,
            specialization: specialization,
            types: types,
            locationUrl: locationUrl);

  factory OrganizationsModel.empty() {
    return OrganizationsModel(
        id: 0,
        title: '',
        slug: '',
        logo: ImageModel.empty(),
        images: const [],
        address: '',
        phoneNumber: '',
        phoneNumbers: const [],
        rating: 0,
        specialization: const [],
        types: const [],
        locationUrl: '');
  }

  @override
  String toString() {
    return 'OrganizationsModel(id: $id,title: $title,slug: $slug,logo: $logo,images: $images,address: $address,phoneNumber: $phoneNumber,phoneNumbers: $phoneNumbers,rating: $rating,specialization: $specialization,types: $types,locationUrl: $locationUrl)';
  }
}
