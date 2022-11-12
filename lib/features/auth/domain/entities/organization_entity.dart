import 'package:anatomica/features/auth/data/models/phone_number_model.dart';
import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/data/models/type_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/phone_number_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';
import 'package:anatomica/features/auth/domain/entities/type_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class OrganizationEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String slug;
  @JsonKey(defaultValue: '')
  final String logo;
  @JsonKey(defaultValue: [])
  @ImageConverter()
  final List<ImageEntity> images;
  @JsonKey(defaultValue: '')
  final String address;
  @JsonKey(defaultValue: '')
  final String phoneNumber;
  @JsonKey(defaultValue: [])
  @PhoneNumberConverter()
  final List<PhoneNumberEntity> phoneNumbers;
  @JsonKey(defaultValue: 0)
  final double rating;
  @JsonKey(defaultValue: 0)
  final double latitude;
  @JsonKey(defaultValue: 0)
  final double longitude;
  @JsonKey(defaultValue: [])
  @SpecializationConverter()
  final List<SpecializationEntity> specialization;
  @JsonKey(defaultValue: [])
  @TypeConverter()
  final List<TypeEntity> types;
  @JsonKey(defaultValue: '')
  final String locationUrl;
  const OrganizationEntity({
    this.title = '',
    this.id = 0,
    this.phoneNumber = '',
    this.specialization = const [],
    this.address = '',
    this.rating = 0,
    this.latitude = 0,
    this.longitude = 0,
    this.slug = '',
    this.images = const [],
    this.locationUrl = '',
    this.logo = '',
    this.name = '',
    this.phoneNumbers = const [],
    this.types = const [],
  });
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
        locationUrl,
        name
      ];
}
