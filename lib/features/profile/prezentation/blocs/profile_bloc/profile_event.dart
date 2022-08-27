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