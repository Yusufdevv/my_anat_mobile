// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      organizations: (json['organizations'] as List<dynamic>?)
              ?.map((e) => const OrganizationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          [],
      isSubscribed: json['is_subscribed'] as bool? ?? false,
      isOrganization: json['is_organization'] as bool? ?? false,
      isDoctor: json['is_doctor'] as bool? ?? false,
      doctor: json['doctor'] == null
          ? const DoctorEntity()
          : const DoctorConverter()
              .fromJson(json['doctor'] as Map<String, dynamic>?),
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      img: json['img'] == null
          ? const ImageEntity()
          : const ImageConverter()
              .fromJson(json['img'] as Map<String, dynamic>?),
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'username': instance.username,
      'img': const ImageConverter().toJson(instance.img),
      'phone_number': instance.phoneNumber,
      'is_doctor': instance.isDoctor,
      'is_organization': instance.isOrganization,
      'is_subscribed': instance.isSubscribed,
      'doctor': const DoctorConverter().toJson(instance.doctor),
      'organizations': instance.organizations
          .map(const OrganizationConverter().toJson)
          .toList(),
    };
