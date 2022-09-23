import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/titler.dart';

class HospitalDoctorsEntity {
  final String fullName;
  final int id;

  final TitlerModel specialization;
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
    this.specialization = const TitlerModel(id: 0,title: ''),
    this.id = 0,
    this.fullName = '',
    this.image = const ImageEntity(),
    this.position = '',
    this.phoneNumber = '',
    this.workExperience = 0,
    this.address = '',
  });
}
