import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/titler.dart';

class HospitalDoctorsEntity {
  final String fullName;
  final int id;
  final List<TitlerModel> specializations;
  final double rating;
  @ImageConverter()
  final ImageEntity image;
  final String position;
  final String phoneNumber;
  final int workExperience;
  final String address;
  final bool isFavourite;

  final bool imgIsFull;
  final double latitude;
  final double longitude;
  final List<List<String>> phoneNumbers;
  final double distance;

  const HospitalDoctorsEntity({
    this.isFavourite = false,
    this.rating = 0,
    this.specializations = const [],
    this.id = 0,
    this.fullName = '',
    this.image = const ImageEntity(),
    this.position = '',
    this.phoneNumber = '',
    this.workExperience = 0,
    this.address = '',
    this.distance = 0,
    this.imgIsFull = false,
    this.latitude = 0,
    this.longitude = 0,
    this.phoneNumbers = const [],
  });
}
