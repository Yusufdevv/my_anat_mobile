import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/profile/domain/usecases/get_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  ProfileBloc({required GetProfileUseCase getProfileUseCase})
      : _getProfileUseCase = getProfileUseCase,
        super(const ProfileState.empty()) {
    on<ProfileEvent>((event, emit) async {
      emit(state.copyWith(getProfileStatus: FormzStatus.submissionInProgress));
      final getProfileResult = await _getProfileUseCase.call(NoParams());
      print('full name from bloc: ${getProfileResult.right.fullName}');
      if (getProfileResult.isRight) {
        emit(state.copyWith(
            profileEntity: getProfileResult.right,
            getProfileStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(getProfileStatus: (FormzStatus.submissionFailure)));
      }
    });
  }
}
