import 'package:anatomica/features/auth/data/models/specialization_model.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/specialization_entity.dart';

class HospitalDoctorsEntity {
  final String fullName;
  final int id;
  final String specialization;
  final double rating;
  @ImageConverter()
  final ImageEntity image;
  final String position;
  final String phoneNumber;
  final int workExperience;
  final String address;
  final bool isFavourite;
  const HospitalDoctorsEntity({
    this.isFavourite = false,
    this.rating = 0,
    this.specialization = '',
    this.id = 0,
    this.fullName = '',
    this.image = const ImageEntity(),
    this.position = '',
    this.phoneNumber = '',
    this.workExperience = 0,
    this.address = '',
  });
}
