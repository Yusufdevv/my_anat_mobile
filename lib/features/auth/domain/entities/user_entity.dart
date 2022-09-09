import 'package:anatomica/features/auth/data/models/doctor_model.dart';
import 'package:anatomica/features/auth/data/models/organization_model.dart';
import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/organization_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String username;
  @ImageConverter()
  final ImageEntity img;
  final String phoneNumber;
  final bool isDoctor;
  final bool isOrganization;
  final bool isSubscribed;
  @DoctorConverter()
  final DoctorEntity doctor;
  @OrganizationConverter()
  final List<OrganizationEntity> organizations;

  const UserEntity({
    this.id = 0,
    this.img = const ImageEntity(),
    this.fullName = '',
    this.email = '',
    this.username = '',
    this.doctor = const DoctorEntity(),
    this.isDoctor = false,
    this.isOrganization = false,
    this.isSubscribed = false,
    this.organizations = const [],
    this.phoneNumber = '',
  });

  UserEntity copyWith(
          {int? id,
          String? fullName,
          String? email,
          String? username,
          ImageEntity? img,
          String? phoneNumber,
          bool? isDoctor,
          bool? isOrganization,
          bool? isSubscribed,
          DoctorEntity? doctor,
          List<OrganizationEntity>? organizations}) =>
      UserEntity(
        id: id ?? this.id,
        doctor: doctor ?? this.doctor,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        img: img ?? this.img,
        isDoctor: isDoctor ?? this.isDoctor,
        isOrganization: isOrganization ?? this.isOrganization,
        isSubscribed: isSubscribed ?? this.isSubscribed,
        organizations: organizations ?? this.organizations,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        username: username ?? this.username,
      );

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        username,
        img,
        phoneNumber,
        isDoctor,
        isOrganization,
        isSubscribed,
        doctor,
        organizations,
      ];
}
