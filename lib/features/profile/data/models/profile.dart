import 'package:anatomica/features/profile/data/models/doctor.dart';
import 'package:anatomica/features/profile/data/models/image.dart';
import 'package:anatomica/features/profile/data/models/organizations.dart';
import 'package:anatomica/features/profile/domain/entities/profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(createToJson: false)
class ProfileModel extends ProfileEntity {
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  const ProfileModel(
      {required int id,
      required String fullName,
      required String email,
      required String username,
      required ImageModel? image,
      required String phoneNumber,
      required bool isDoctor,
      required bool isOrganization,
      required bool isSubscribed,
      required DoctorModel? doctor,
      required OrganizationsModel? organization})
      : super(
          id: id,
          fullName: fullName,
          email: email,
          username: username,
          image: image,
          phoneNumber: phoneNumber,
          isDoctor: isDoctor,
          isOrganization: isOrganization,
          isSubscribed: isSubscribed,
          doctor: doctor,
          organization: organization,
        );

  factory ProfileModel.empty() {
    return ProfileModel(
        id: 0,
        fullName: '',
        email: '',
        username: '',
        image: ImageModel.empty(),
        phoneNumber: '',
        isDoctor: false,
        isOrganization: false,
        isSubscribed: false,
        doctor: DoctorModel.empty(),
        organization: OrganizationsModel.empty());
  }

  @override
  String toString() {
    return 'ProfileModel(id: $id, fullName: $fullName, email: $email, username: $username, image: $image,phoneNumber: $phoneNumber, isDoctor: $isDoctor,isOrganization: $isOrganization, isSubscribed: $isSubscribed, doctor: $doctor,organization: $organization)';
  }
}
