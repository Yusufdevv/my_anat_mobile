import 'package:anatomica/features/common/entities/map_position.dart';
import 'package:anatomica/features/common/models/logo.dart';

class HospitalSingleEntity {
  final int id;

  final String slug;

  final String name;

  final AssetModel icon;

  final String address;

  final double rating;

  final String phone;

  final MapPosition location;
  final AssetModel bannerImage;
  final String description;

  const HospitalSingleEntity({ this.rating = 0,
    this.address = '',
    this.id =0,
    this.name = '',
    this.slug = '',
    this.phone = '',
    this.location = const MapPosition(lat: 0, long: 0, zoomLevel: 10),
    this.description = '',
    this.icon =  const AssetModel(small: '', middle: '', origin: ''),
    this.bannerImage = const AssetModel(small: '', middle: '', origin: '')});
}
