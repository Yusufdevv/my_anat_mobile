import 'package:anatomica/features/auth/domain/entities/image_entity.dart';

class DoctorSpecEntity {
  final String fullName;
  final int id;
  final String specialization;
  final double rating;
  @ImageConverter()
  final ImageEntity image;
  final String position;
  final List<List<String>> phoneNumbers;
  final int workExperience;
  final String address;
  final bool isFavourite;
  final double latitude;
  final double longitude;

  const DoctorSpecEntity(
      {this.isFavourite = false,
      this.rating = 0,
      this.specialization = '',
      this.id = 0,
      this.fullName = '',
      this.position = '',
      this.phoneNumbers = const [],
      this.workExperience = 0,
      this.address = '',
      this.latitude = 0,
      this.longitude = 0,
      this.image = const ImageEntity()});
}
