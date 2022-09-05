import 'package:anatomica/features/common/entities/map_position.dart';
import 'package:anatomica/features/common/models/logo.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital_model.g.dart';

@JsonSerializable()
class HospitalModel extends HospitalSingleEntity {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @JsonKey(name: 'address', defaultValue: '')
  final String address;
  @JsonKey(name: 'phone', defaultValue: '')
  final String phone;
  @JsonKey(name: 'website', defaultValue: '')
  final String website;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'instagram', defaultValue: '')
  final String instagram;
  @JsonKey(name: 'facebook', defaultValue: '')
  final String facebook;
  @JsonKey(name: 'telegram', defaultValue: '')
  final String telegram;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'images', defaultValue: [])
  final List<AssetModel> images;
  @JsonKey(
    name: 'logo',
  )
  final AssetModel logo;

  @JsonKey(name: 'latitude', defaultValue: 0)
  final double latitude;
  @JsonKey(name: 'longitude', defaultValue: 0)
  final double longitude;
  @JsonKey(name: 'rating', defaultValue: 0)
  final double rating;

  HospitalModel(
      {required this.slug,
      required this.telegram,
      required this.email,
      required this.website,
      required this.instagram,
      required this.facebook,
      required this.images,
      required this.rating,
      required this.id,
      required this.address,
      required this.phone,
      required this.description,
      required this.title,
      required this.logo,
      required this.longitude,
      required this.latitude})
      : super(
            images: images,
            id: id,
            address: address,
            rating: rating,
            name: title,
            slug: slug,
            phone: phone,
            location:
                MapPosition(lat: latitude, long: longitude, zoomLevel: 15),
            description: description,
            icon: logo);

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalModelFromJson(json);
}
