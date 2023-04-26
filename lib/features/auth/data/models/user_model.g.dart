// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      organizations: (json['organizations'] as List<dynamic>?)
              ?.map((e) => const UserOrganizationConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
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
      birthDay: json['birth_day'] as String? ?? '',
      autoRenewDoctor: json['auto_renew_doctor'] as bool? ?? false,
      autoRenewJournal: json['auto_renew_journal'] as bool? ?? false,
      autoRenewOrganization: json['auto_renew_organization'] as bool? ?? false,
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
      'birth_day': instance.birthDay,
      'doctor': const DoctorConverter().toJson(instance.doctor),
      'organizations': instance.organizations
          .map(const UserOrganizationConverter().toJson)
          .toList(),
      'auto_renew_doctor': instance.autoRenewDoctor,
      'auto_renew_organization': instance.autoRenewOrganization,
      'auto_renew_journal': instance.autoRenewJournal,
    };
