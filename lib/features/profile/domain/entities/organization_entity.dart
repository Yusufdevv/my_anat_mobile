import 'package:anatomica/features/profile/domain/entities/image_entity.dart';
import 'package:anatomica/features/profile/domain/entities/phone_number_entity.dart';
import 'package:anatomica/features/profile/domain/entities/type_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OrganizationEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @JsonKey(name: 'logo')
  final ImageEntity? logo;
  @JsonKey(name: 'images', defaultValue: [])
  final List<ImageEntity> images;
  @JsonKey(name: 'address', defaultValue: '')
  final String address;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @JsonKey(name: 'phone_numbers', defaultValue: [])
  final List<PhoneNumberEntity> phoneNumbers;
  @JsonKey(name: 'rating', defaultValue: 0)
  final int rating;
  @JsonKey(name: 'specialization', defaultValue: [])
  final List<TypeEntity> specialization;
  @JsonKey(name: 'types', defaultValue: [])
  final List<TypeEntity> types;
  @JsonKey(name: 'location_url', defaultValue: '')
  final String locationUrl;

  const OrganizationEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.logo,
    required this.images,
    required this.address,
    required this.phoneNumber,
    required this.phoneNumbers,
    required this.rating,
    required this.specialization,
    required this.types,
    required this.locationUrl,
  });

  factory OrganizationEntity.empty() => OrganizationEntity(
      id: 0,
      title: '',
      slug: '',
      logo: ImageEntity.empty(),
      images: const [],
      address: '',
      phoneNumber: '',
      phoneNumbers: const [],
      rating: 0,
      specialization: const [],
      types: const [],
      locationUrl: '');

  @override
  List<Object?> get props => [
        id,
        title,
        slug,
        logo,
        images,
        address,
        phoneNumber,
        phoneNumbers,
        rating,
        specialization,
        types,
        locationUrl
      ];

  OrganizationEntity copyWith({
    int? id,
    String? title,
    String? slug,
    ImageEntity? logo,
    List<ImageEntity>? images,
    String? address,
    String? phoneNumber,
    List<PhoneNumberEntity>? phoneNumbers,
    int? rating,
    List<TypeEntity>? specialization,
    List<TypeEntity>? types,
    String? locationUrl,
  }) =>
      OrganizationEntity(
          id: id ?? this.id,
          title: title ?? this.title,
          slug: slug ?? this.slug,
          logo: logo ?? this.logo,
          images: images ?? this.images,
          address: address ?? this.address,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          phoneNumbers: phoneNumbers ?? this.phoneNumbers,
          rating: rating ?? this.rating,
          specialization: specialization ?? this.specialization,
          types: types ?? this.types,
          locationUrl: locationUrl ?? this.locationUrl);
}
