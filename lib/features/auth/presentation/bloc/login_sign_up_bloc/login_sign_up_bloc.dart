import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/features/auth/domain/usecases/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'login_sign_up_event.dart';
part 'login_sign_up_state.dart';

class LoginSignUpBloc extends Bloc<LoginSignUpEvent, LoginSignUpState> {
  final LoginUseCase _loginUseCase;
  LoginSignUpBloc({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(const LoginSignUpState.empty()) {
    on<Login>((event, emit) async {
      emit(state.copyWith(loginStatus: FormzStatus.submissionInProgress));
      final loginResult = await _loginUseCase.call(LoginParams(password: event.password, username: event.username));
      if (loginResult.isRight) {
        emit(state.copyWith(loginStatus: FormzStatus.submissionSuccess));
      } else {
        if (loginResult.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (loginResult.left is ParsingFailure) {
          event.onError((loginResult.left as ParsingFailure).errorMessage);
        } else if (loginResult.left is ServerFailure) {
          event.onError((loginResult.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(loginStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
