import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/delete_account_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/edit_profile.dart';
import 'package:anatomica/features/profile/domain/usecases/get_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final EditProfileUseCase _editProfileUseCase =
      EditProfileUseCase(repository: serviceLocator<ProfileRepositoryImpl>());

  ProfileBloc(
      {required GetProfileUseCase getProfileUseCase,
      required DeleteAccountUseCase deleteAccountUsecase})
      : _getProfileUseCase = getProfileUseCase,
        _deleteAccountUseCase = deleteAccountUsecase,
        super(const ProfileState.empty()) {
    on<GetProfileEvent>((event, emit) async {
      emit(state.copyWith(getProfileStatus: FormzStatus.submissionInProgress));
      final getProfileResult = await _getProfileUseCase.call(NoParams());
      if (getProfileResult.isRight) {
        emit(state.copyWith(
            profileEntity: getProfileResult.right,
            getProfileStatus: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(getProfileStatus: (FormzStatus.submissionFailure)));
      }
    });
    on<UpdateUserAutoPayStatusEvent>((event, emit) async {
      // emit(state.copyWith(status: FormzStatus.submissionInProgress));
      add(UpdateProfileEvent(profileEntity: event.profileEntity));
      final Map<String, dynamic> map = {
        "auto_renew_doctor": event.profileEntity.autoRenewDoctor,
        "auto_renew_organization": event.profileEntity.autoRenewOrganization,
        "auto_renew_journal": event.profileEntity.autoRenewJournal
      };
      final result =
          await _editProfileUseCase.call(EditProfileParams(data: map));
      if (result.isRight) {
        // emit(state.copyWith(status: FormzStatus.submissionSuccess));
        // event.onSuccess();
      } else {
        // emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
    on<UpdateProfileEvent>((event, emit) {
      emit(state.copyWith(profileEntity: event.profileEntity));
    });
    on<DeleteAccount>((event, emit) async {
      final result = await _deleteAccountUseCase.call(NoParams());
      if (result.isRight) {
        event.onSuccess();
      }
    });
  }
}
