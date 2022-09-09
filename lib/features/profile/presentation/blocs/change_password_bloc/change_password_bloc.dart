import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  ChangePasswordBloc({required ChangePasswordUseCase changePasswordUseCase})
      : _changePasswordUseCase = changePasswordUseCase,
        super(const ChangePasswordState(changePasswordStatus: FormzStatus.pure)) {
    on<ChangePassword>((event, emit) async {
      if (event.currentPassword.isEmpty) {
        event.onFailure('Eski parol bo\'sh bo\'lishi mumkin emas!');
      } else if (event.newPassword.isEmpty) {
        event.onFailure('Yangi parol bo\'sh bo\'lishi mumkin emas!');
      } else if (event.newPasswordConfirmed.isEmpty) {
        event.onFailure('Takrorlangan yangi parol bo\'sh bo\'lishi mumkin emas!');
      } else if (event.newPassword != event.newPasswordConfirmed) {
        event.onFailure('Parollar mos kelmadi!');
      } else {
        emit(state.copyWith(changePasswordStatus: FormzStatus.submissionInProgress));
        final result = await _changePasswordUseCase
            .call(ChangePasswordParams(currentPassword: event.currentPassword, newPassword: event.newPassword));
        if (result.isRight) {
          emit(state.copyWith(changePasswordStatus: FormzStatus.submissionSuccess));
          event.onSuccess();
        } else {
          if (result.left is DioFailure) {
            event.onFailure('Tarmoqqa ulanishda muammo!');
          } else if (result.left is ParsingFailure) {
            event.onFailure((result.left as ParsingFailure).errorMessage);
          } else if (result.left is ServerFailure) {
            event.onFailure('Eski parol xato kiritildi!');
          } else {
            event.onFailure(result.left.toString());
          }
          emit(state.copyWith(changePasswordStatus: FormzStatus.submissionFailure));
        }
      }
    });
  }
}
