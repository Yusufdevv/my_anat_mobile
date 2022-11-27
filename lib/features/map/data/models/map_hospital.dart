import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/logo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'map_hospital.g.dart';

@JsonSerializable()
class MapHospitalModel {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'slug', defaultValue: '')
  final String slug;
  @ImageConverter()
  final ImageEntity logo;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'images', defaultValue: [])
  final List<AssetModel> images;
  @JsonKey(name: 'work_from', defaultValue: '')
  final String workFrom;
  @JsonKey(name: 'work_to', defaultValue: '')
  final String workTo;
  @JsonKey(name: 'address', defaultValue: '')
  final String address;
  @JsonKey(name: 'rating', defaultValue: 0)
  final double rating;
  @JsonKey(name: 'latitude', defaultValue: 0)
  final double latitude;
  @JsonKey(name: 'longitude', defaultValue: 0)
  final double longitude;
  @JsonKey(name: 'distance', defaultValue: 0)
  final double distance;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;

  MapHospitalModel(
      {required this.rating,
      required this.distance,
      required this.images,
      required this.longitude,
      required this.latitude,
      required this.id,
      required this.address,
      required this.title,
      required this.slug,
      required this.phoneNumber,
      required this.workFrom,
      this.logo = const ImageEntity(),
      required this.workTo});
  factory MapHospitalModel.fromJson(Map<String, dynamic> json) =>
      _$MapHospitalModelFromJson(json);
}
