import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:equatable/equatable.dart';

class DoctorMapEntity extends Equatable {
  const DoctorMapEntity({
    this.id = -1,
    this.fullName = '',
    this.doctorName  = '',
    this.image = const ImageEntity(),
    this.imgIsFull = false,
    this.position = '',
    this.address = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.rating = 0,
    this.phoneNumbers = const <List<String>>[],
    this.organizationName = '',
    this.distance = 0,
    this.specializations = const [],

  });

  final int id;
  final String fullName;
  final String doctorName ;
  @ImageConverter()
  final ImageEntity image;
  final List<TitlerModel> specializations;
  final bool imgIsFull;
  final String position;
  final String address;
  final double latitude;
  final double longitude;
  final num rating;
  final List<List<String>> phoneNumbers;
  final String organizationName;
  final double distance;

  @override
  List<Object?> get props => [
        id,
        fullName,
        doctorName ,
        image,
        imgIsFull,
        specializations,
        position,
        address,
        latitude,
        longitude,
        rating,
        phoneNumbers,
        organizationName,
        distance,
      ];
}
