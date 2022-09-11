import 'package:anatomica/features/common/data/models/logo.dart';

class DoctorsEntity {
  final String name;
  final int id;
  final String specialization;
  final double rating;
  final AssetModel image;
  final double lat;
  final double long;
  DoctorsEntity(
      {required this.rating,
      required this.specialization,
      required this.id,
      required this.name,
      required this.image,
      required this.lat,
      required this.long});
}
