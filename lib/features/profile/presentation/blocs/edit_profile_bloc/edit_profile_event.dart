part of 'edit_profile_bloc.dart';

@Freezed()
class EditProfileEvent with _$EditProfileEvent {
  factory EditProfileEvent.changeName(String text) = _ChangeName;

  factory EditProfileEvent.changeSurname(String text) = _ChangeSurname;

  factory EditProfileEvent.changePhoneNumber(String text) = _ChangePhoneNumber;

  factory EditProfileEvent.changeEmail(String text) = _ChangeEmail;

  factory EditProfileEvent.changeDate(String text) = _ChangeDate;

  factory EditProfileEvent.changeImage(String image) = _ChangeImage;

  factory EditProfileEvent.verifyOTPCode(String code) = _VerifyOTPCode;

  factory EditProfileEvent.editPhone(
      {required String phone,
      required ValueChanged<String> onError,
      required VoidCallback onSuccess}) = _EditPhone;

  factory EditProfileEvent.editEmail(
      {required String email,
      required ValueChanged<String> onError,
      required VoidCallback onSuccess}) = _EditEmail;

  factory EditProfileEvent.verifyOtpCode(
      {String? email,
      String? phone,
      required String type,
      required String signature,
      required String code,
      required ValueChanged<String> onError,
      required VoidCallback onSuccess}) = _VerifyOtpCode;

  factory EditProfileEvent.saveData(
      {required ValueChanged<String> onError,
      required VoidCallback onSuccess}) = _SaveData;
}
