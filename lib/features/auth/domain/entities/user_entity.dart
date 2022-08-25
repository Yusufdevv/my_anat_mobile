import 'package:anatomica/features/auth/data/models/doctor_model.dart';
import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/auth/data/models/organization_model.dart';
import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/organization_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String fullName;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String username;
  @ImageConverter()
  final ImageEntity img;
  @JsonKey(defaultValue: '')
  final String phoneNumber;
  @JsonKey(defaultValue: false)
  final bool isDoctor;
  @JsonKey(defaultValue: false)
  final bool isOrganization;
  @JsonKey(defaultValue: false)
  final bool isSubscribed;
  @DoctorConverter()
  final DoctorEntity doctor;
  @JsonKey(defaultValue: [])
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
