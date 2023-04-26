import 'package:anatomica/features/auth/data/models/doctor_model.dart';
import 'package:anatomica/features/auth/data/models/user_organization_model.dart';
import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/user_organization_entity.dart';
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
  final String birthDay;
  @DoctorConverter()
  final DoctorEntity doctor;
  @UserOrganizationConverter()
  final List<UserOrganizationEntity> organizations;
  final bool autoRenewDoctor;
  final bool autoRenewOrganization;
  final bool autoRenewJournal;

  const UserEntity({
    this.id = 0,
    this.birthDay = '',
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
    this.autoRenewDoctor = false,
    this.autoRenewOrganization = false,
    this.autoRenewJournal = false,
  });

  UserEntity copyWith({
    int? id,
    String? birthDate,
    String? fullName,
    String? email,
    String? username,
    ImageEntity? img,
    String? phoneNumber,
    bool? isDoctor,
    bool? autoRenewDoctor,
    bool? autoRenewOrganization,
    bool? autoRenewJournal,
    bool? isOrganization,
    bool? isSubscribed,
    DoctorEntity? doctor,
    List<UserOrganizationEntity>? organizations,
  }) =>
      UserEntity(
        birthDay: birthDate ?? birthDay,
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
        autoRenewDoctor: autoRenewDoctor ?? this.autoRenewDoctor,
        autoRenewOrganization: autoRenewOrganization ?? this.autoRenewOrganization,
        autoRenewJournal: autoRenewJournal ?? this.autoRenewJournal,
      );

  @override
  List<Object?> get props => [
        id,
        fullName,
        birthDay,
        email,
        username,
        img,
        phoneNumber,
        isDoctor,
        isOrganization,
        isSubscribed,
        doctor,
        organizations,
        autoRenewDoctor,
        autoRenewOrganization,
        autoRenewJournal,
      ];
}
