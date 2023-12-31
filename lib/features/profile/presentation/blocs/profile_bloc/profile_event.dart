part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final UserEntity profileEntity;

  UpdateProfileEvent({
    required this.profileEntity,
  });
}
class UpdateUserAutoPayStatusEvent extends ProfileEvent {
  final UserEntity profileEntity;

  UpdateUserAutoPayStatusEvent({
    required this.profileEntity,
  });
}

class DeleteAccount extends ProfileEvent {
  final VoidCallback onSuccess;
  DeleteAccount({required this.onSuccess});
}
