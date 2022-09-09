part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final UserEntity profileEntity;
  final FormzStatus getProfileStatus;

  const ProfileState(
      {required this.profileEntity, required this.getProfileStatus});

  const ProfileState.empty([
    this.profileEntity = const UserEntity(),
    this.getProfileStatus = FormzStatus.pure,
  ]);

  ProfileState copyWith({
    UserEntity? profileEntity,
    FormzStatus? getProfileStatus,
  }) =>
      ProfileState(
        profileEntity: profileEntity ?? this.profileEntity,
        getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      );

  List<Object?> get props => [
        profileEntity,
        getProfileStatus,
      ];
}
