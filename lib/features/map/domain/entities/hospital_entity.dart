import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/logo.dart';

class HospitalEntity {
  final String slug;
  @ImageConverter()
  final ImageEntity logo;
  final String title;
  final String address;
  final List<AssetModel> images;
  final double rating;
  final String inn;
  final String phoneNumber;
  final String locationUrl;
  final bool workAllDay;
  final double latitude;
  final double longitude;
  final int id;

  HospitalEntity(
      {required this.rating,
      required this.title,
      required this.images,
      required this.address,
      required this.slug,
      required this.id,
      this.longitude = -1,
      this.latitude = -1,
      this.inn = '',
      this.locationUrl = '',
      this.workAllDay = false,
        this.phoneNumber = '',
      this.logo = const ImageEntity()});
}
