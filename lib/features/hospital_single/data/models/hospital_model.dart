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
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(
    name: 'logo',
  )
  final AssetModel logo;
  @JsonKey(name: 'images', defaultValue: [])
  final List<AssetModel> banner;
  @JsonKey(name: 'latitude', defaultValue: 0)
  final double latitude;
  @JsonKey(name: 'longitude', defaultValue: 0)
  final double longitude;
  @JsonKey(name: 'rating', defaultValue: 0)
  final double rating;

  HospitalModel(
      {required this.slug,
      required this.rating,
      required this.id,
      required this.banner,
      required this.address,
      required this.phone,
      required this.description,
      required this.title,
      required this.logo,
      required this.longitude,
      required this.latitude}):super(id:id,address: address,rating: rating,name: title,slug: slug,phone: phone,location: MapPosition(lat: latitude, long: longitude, zoomLevel: 15),description: description,icon: logo);
  factory HospitalModel.fromJson(Map<String,dynamic> json)=>_$HospitalModelFromJson(json );
}
