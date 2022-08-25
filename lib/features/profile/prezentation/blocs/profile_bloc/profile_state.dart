// part of 'profile_bloc.dart';
//
// @immutable
// class ProfileState {
//   final ProfileEntity profileEntity;
//   final FormzStatus getProfileStatus;
//
//   const ProfileState(
//       {required this.profileEntity, required this.getProfileStatus});
//
//   // const ProfileState.empty([
//   //   // this.profileEntity = ProfileEntity.empty(),
//   //   this.getProfileStatus = FormzStatus.pure,
//   // ]);
//
//   ProfileState copyWith({
//     ProfileEntity? profileEntity,
//     FormzStatus? getProfileStatus,
//   }) =>
//       ProfileState(
//         profileEntity: profileEntity ?? this.profileEntity,
//         getProfileStatus: getProfileStatus ?? this.getProfileStatus,
//       );
//
//   List<Object?> get props => [
//         profileEntity,
//         getProfileStatus,
//       ];
// }
