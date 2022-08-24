// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as int? ?? 0,
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      username: json['username'] as String? ?? '',
      image: json['img'] == null
          ? null
          : ImageModel.fromJson(json['img'] as Map<String, dynamic>),
      phoneNumber: json['phone_number'] as String? ?? '',
      isDoctor: json['is_doctor'] as bool? ?? false,
      isOrganization: json['is_organization'] as bool? ?? false,
      isSubscribed: json['is_subscribed\t'] as bool? ?? false,
      doctor: json['doctor'] == null
          ? null
          : DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      organization: json['organizations'] == null
          ? null
          : OrganizationsModel.fromJson(
              json['organizations'] as Map<String, dynamic>),
    );
