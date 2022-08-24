import 'package:anatomica/features/profile/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/profile/domain/entities/image_entity.dart';
import 'package:anatomica/features/profile/domain/entities/organization_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProfileEntity extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @JsonKey(name: 'full_name', defaultValue: '')
  final String fullName;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'username', defaultValue: '')
  final String username;
  @JsonKey(name: 'img')
  final ImageEntity? image;
  @JsonKey(name: 'phone_number', defaultValue: '')
  final String phoneNumber;
  @JsonKey(name: 'is_doctor', defaultValue: false)
  final bool isDoctor;
  @JsonKey(name: 'is_organization', defaultValue: false)
  final bool isOrganization;
  @JsonKey(name: 'is_subscribed	', defaultValue: false)
  final bool isSubscribed;
  @JsonKey(name: 'doctor')
  final DoctorEntity? doctor;
  @JsonKey(name: 'organizations')
  final OrganizationEntity? organization;

  const ProfileEntity(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.username,
      required this.image,
      required this.phoneNumber,
      required this.isDoctor,
      required this.isOrganization,
      required this.isSubscribed,
      required this.doctor,
      required this.organization});

  factory ProfileEntity.empty() => ProfileEntity(
      id: 0,
      fullName: '',
      email: '',
      username: '',
      image: ImageEntity.empty(),
      phoneNumber: '',
      isDoctor: false,
      isOrganization: false,
      isSubscribed: false,
      doctor: DoctorEntity.empty(),
      organization: OrganizationEntity.empty());

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        username,
        image,
        phoneNumber,
        isDoctor,
        isOrganization,
        isSubscribed,
        doctor,
        organization
      ];

  ProfileEntity copyWith({
    int? id,
    String? fullName,
    String? email,
    String? username,
    ImageEntity? image,
    String? phoneNumber,
    bool? isDoctor,
    bool? isOrganization,
    bool? isSubscribed,
    DoctorEntity? doctor,
    OrganizationEntity? organization,
  }) =>
      ProfileEntity(
          id: id ?? this.id,
          fullName: fullName ?? this.fullName,
          email: email ?? this.email,
          username: username ?? this.username,
          image: image ?? this.image,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          isDoctor: isDoctor ?? this.isDoctor,
          isOrganization: isOrganization ?? this.isOrganization,
          isSubscribed: isSubscribed ?? this.isSubscribed,
          doctor: doctor ?? this.doctor,
          organization: organization ?? this.organization);
}
