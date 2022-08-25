// import 'package:anatomica/core/usecases/usecase.dart';
// import 'package:anatomica/features/profile/domain/entities/profile_entity.dart';
// import 'package:anatomica/features/profile/domain/usecases/get_profile.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:formz/formz.dart';
//
// part 'profile_event.dart';
//
// part 'profile_state.dart';
//
// class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
//   final GetProfileUseCase _getProfileUseCase;
//
//   ProfileBloc({required GetProfileUseCase getProfileUseCase})
//       : _getProfileUseCase = getProfileUseCase,
//         super(const ProfileState(
//
//             getProfileStatus: FormzStatus.submissionFailure)) {
//     on<ProfileEvent>((event, emit) async {
//       emit(state.copyWith(getProfileStatus: FormzStatus.submissionInProgress));
//       final getProfileResult = await _getProfileUseCase.call(NoParams());
//       if (getProfileResult.isRight) {
//         emit(state.copyWith(
//             profileEntity: getProfileResult.right,
//             getProfileStatus: FormzStatus.submissionSuccess));
//       } else {
//         emit(state.copyWith(getProfileStatus: (FormzStatus.submissionFailure)));
//       }
//     });
//     on<UpdateProfileEvent>((event, emit) {
//       print('name event: ${event.profileEntity.fullName}');
//       final newState = state.copyWith(
//           profileEntity: state.profileEntity.copyWith(
//               fullName: event.profileEntity.fullName,
//               doctor: event.profileEntity.doctor,
//               username: event.profileEntity.username));
//       emit(newState);
//     });
//   }
// }
