part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  final FormzStatus status;
  final String lastName;
  final String firstName;
  final String userName;
  final String email;
  final int imageId;
  final String phoneNumber;


  const EditProfileState({
    required this.status,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.imageId,
    required this.userName,
    required this.phoneNumber,
  });

  EditProfileState copyWith({
    FormzStatus? status,
    String? lastName,
    String? firstName,
    String? email,
    int? imageId,
    String? userName,
    String? phoneNumber,
  }) =>
      EditProfileState(
        userName: userName ?? this.userName,
        status: status ?? this.status,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        imageId: imageId ?? this.imageId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
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
      ];
}
