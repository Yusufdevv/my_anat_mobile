part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final FormzStatus status;
  final String lastName;
  final String firstName;
  final String userName;
  final String email;
  final int imageId;
  final String phoneNumber;
  final String imageUrl;
  final String birthDate;
  final String signature;

  const EditProfileState({
    required this.status,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.imageId,
    required this.userName,
    required this.phoneNumber,
    required this.imageUrl,
    required this.birthDate,
    required this.signature,
  });

  EditProfileState copyWith({
    FormzStatus? status,
    String? lastName,
    String? firstName,
    String? email,
    int? imageId,
    String? userName,
    String? phoneNumber,
    String? imageUrl,
    String? birthDate,
    String? signature,
  }) =>
      EditProfileState(
        userName: userName ?? this.userName,
        status: status ?? this.status,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        imageId: imageId ?? this.imageId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        imageUrl: imageUrl ?? this.imageUrl,
        birthDate: birthDate ?? this.birthDate,
        signature: signature ?? this.signature,
      );

  @override
  List<Object?> get props => [
        status,
        lastName,
        firstName,
        email,
        imageId,
        userName,
        phoneNumber,
        imageUrl,
        birthDate,signature,
      ];
}
