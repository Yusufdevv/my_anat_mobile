import 'package:anatomica/features/common/entities/map_position.dart';
import 'package:anatomica/features/common/models/logo.dart';

class HospitalSingleEntity {
  final int id;

  final String slug;

  final String name;

  final String icon;

  final String address;

  final double rating;

  final String phone;

  final MapPosition location;

  final AssetModel bannerImage;

  final String description;

  HospitalSingleEntity(
      {required this.rating,
      required this.address,
      required this.id,
      required this.name,
      required this.slug,
      required this.phone,
      required this.location,
      required this.description,
      required this.icon,
      required this.bannerImage});
}
