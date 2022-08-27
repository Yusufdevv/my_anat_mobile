part of 'edit_profile_bloc.dart';

@Freezed()
class EditProfileEvent with _$EditProfileEvent {
  factory EditProfileEvent.changeName(String text) = _ChangeName;

  factory EditProfileEvent.changeSurname(String text) = _ChangeSurname;

  factory EditProfileEvent.changePhoneNumber(String text) = _ChangePhoneNumber;

  factory EditProfileEvent.changeEmail(String text) = _ChangeEmail;

  factory EditProfileEvent.changeDate(String text) = _ChangeDate;

  factory EditProfileEvent.changeImage(String image) = _ChangeImage;

  factory EditProfileEvent.saveData() = _SaveData;
}
