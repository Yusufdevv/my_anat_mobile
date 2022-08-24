import 'package:anatomica/features/profile/data/models/district.dart';
import 'package:anatomica/features/profile/data/models/image.dart';
import 'package:anatomica/features/profile/data/models/license.dart';
import 'package:anatomica/features/profile/data/models/region.dart';
import 'package:anatomica/features/profile/domain/entities/doctor_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable(createToJson: false)
class DoctorModel extends DoctorEntity {
  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  const DoctorModel(
      {required int id,
      required String fullName,
      required String position,
      required int workExperience,
      required String work,
      required RegionModel? region,
      required DistrictModel? district,
      required String address,
      required String specialization,
      required String phoneNumber,
      required String email,
      required int rating,
      required bool openToWork,
      required String bio,
      required bool showInProfileBio,
      required LicenseModel? license,
      required String instagram,
      required String telegram,
      required String moderationStatus,
      required ImageModel? img})
      : super(
            id: id,
            fullName: fullName,
            position: position,
            workExperience: workExperience,
            work: work,
            region: region,
            district: district,
            address: address,
            specialization: specialization,
            phoneNumber: phoneNumber,
            email: email,
            rating: rating,
            openToWork: openToWork,
            bio: bio,
            showInProfileBio: showInProfileBio,
            license: license,
            instagram: instagram,
            telegram: telegram,
            moderationStatus: moderationStatus,
            img: img);

  factory DoctorModel.empty() {
    return DoctorModel(
        id: 0,
        fullName: '',
        position: '',
        workExperience: 0,
        work: '',
        region: RegionModel.empty(),
        district: DistrictModel.empty(),
        address: '',
        specialization: '',
        phoneNumber: '',
        email: '',
        rating: 0,
        openToWork: false,
        bio: '',
        showInProfileBio: false,
        license: LicenseModel.empty(),
        instagram: '',
        telegram: '',
        moderationStatus: '',
        img: ImageModel.empty());
  }

  @override
  String toString() {
    return 'DoctorModel(id: $id, fullName: $fullName, position: $position,workExperience: $workExperience, work: $work,region: $region, district: $district,address: $address, specialization: $specialization, phoneNumber: $phoneNumber,email: $email,rating: $rating,openToWork: $openToWork,bio: $bio,showInProfileBio: $showInProfileBio,license: $license,instagram: $instagram,telegram: $telegram,moderationStatus: $moderationStatus,img: $img)';
  }
}
