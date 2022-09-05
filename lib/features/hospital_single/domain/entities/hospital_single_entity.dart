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
  final List<AssetModel> images;
  final String description;
  final String email;

  final String website;

  final String instagram;

  final String facebook;

  final String telegram;

  const HospitalSingleEntity(
      {this.rating = 0,
      this.email = '',
        this.images=const [],
      this.instagram = '',
      this.facebook = '',
      this.telegram = '',
      this.website = '',
      this.address = '',
      this.id = 0,
      this.name = '',
      this.slug = '',
      this.phone = '',
      this.location = const MapPosition(lat: 0, long: 0, zoomLevel: 10),
      this.description = '',
      this.icon = const AssetModel(small: '', middle: '', origin: ''),
      this.bannerImage = const AssetModel(small: '', middle: '', origin: '')});
}
