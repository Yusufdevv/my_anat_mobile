import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/check_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/confirm_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/create_new_state_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/login_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_name_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_password_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_phone_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'login_sign_up_event.dart';
part 'login_sign_up_state.dart';

class LoginSignUpBloc extends Bloc<LoginSignUpEvent, LoginSignUpState> {
  final LoginUseCase _loginUseCase;
  final CheckUsernameUseCase _checkUsernameUseCase;
  final CreateNewStateUseCase _createNewStateUseCase;
  final SubmitNameUserNameUseCase _submitNameUsernameUseCase;
  final SubmitPhoneUseCase _submitPhoneUseCase;
  final SubmitEmailUseCase _submitEmailUseCase;
  final ConfirmUseCase _confirmUseCase;
  final SubmitPasswordUseCase _submitPasswordUseCase;
  LoginSignUpBloc({
    required LoginUseCase loginUseCase,
    required CheckUsernameUseCase checkUsernameUseCase,
    required CreateNewStateUseCase createNewStateUseCase,
    required SubmitNameUserNameUseCase submitNameUsernameUseCase,
    required SubmitPhoneUseCase submitPhoneUseCase,
    required SubmitEmailUseCase submitEmailUseCase,
    required ConfirmUseCase confirmUseCase,
    required SubmitPasswordUseCase submitPasswordUseCase,
  })  : _loginUseCase = loginUseCase,
        _checkUsernameUseCase = checkUsernameUseCase,
        _createNewStateUseCase = createNewStateUseCase,
        _submitNameUsernameUseCase = submitNameUsernameUseCase,
        _submitPhoneUseCase = submitPhoneUseCase,
        _submitEmailUseCase = submitEmailUseCase,
        _confirmUseCase = confirmUseCase,
        _submitPasswordUseCase = submitPasswordUseCase,
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
    on<CheckUsername>((event, emit) async {
      emit(state.copyWith(checkUsernameStatus: FormzStatus.submissionInProgress));
      final result = await _checkUsernameUseCase.call(UsernameParams(username: event.username));
      if (result.isRight) {
        add(CreateState(
            username: event.username, fullName: event.fullName, onError: event.onError, onSuccess: event.onSuccess));
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(checkUsernameStatus: FormzStatus.submissionFailure));
      }
    });
    on<CreateState>((event, emit) async {
      final result = await _createNewStateUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(stateId: result.right));
        add(SubmitNameUsername(
            username: event.username, fullName: event.fullName, onError: event.onError, onSuccess: event.onSuccess));
      } else {
        print('create state error: ${result.left}');
      }
    });
    on<SubmitNameUsername>((event, emit) async {
      final result = await _submitNameUsernameUseCase
          .call(NameUsernameParams(stateId: state.stateId, username: event.username, name: event.fullName));
      if (result.isRight) {
        emit(state.copyWith(checkUsernameStatus: FormzStatus.submissionSuccess, stateId: result.right));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(loginStatus: FormzStatus.submissionFailure));
      }
    });
    on<ChangeConfirmationType>((event, emit) {
      emit(state.copyWith(confirmationType: event.type));
    });
    on<SubmitPhone>((event, emit) async {
      emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionInProgress));
      final result = await _submitPhoneUseCase.call(PhoneParams(stateId: state.stateId, phone: event.phone));
      if (result.isRight) {
        emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionSuccess, stateId: result.right));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionFailure));
      }
    });
    on<SubmitEmail>((event, emit) async {
      emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionInProgress));
      final result = await _submitEmailUseCase.call(EmailParams(stateId: state.stateId, email: event.email));
      if (result.isRight) {
        emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionSuccess, stateId: result.right));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionFailure));
      }
    });
    on<SubmitCode>((event, emit) async {
      emit(state.copyWith(submitCodeStatus: FormzStatus.submissionInProgress));
      final result = await _confirmUseCase.call(ConfirmationParams(stateId: state.stateId, code: event.code));
      if (result.isRight) {
        emit(state.copyWith(submitCodeStatus: FormzStatus.submissionSuccess, stateId: result.right));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(submitCodeStatus: FormzStatus.submissionFailure));
      }
    });
    on<SubmitPassword>((event, emit) async {
      emit(state.copyWith(submitPasswordStatus: FormzStatus.submissionInProgress));
      final result = await _submitPasswordUseCase.call(
          PasswordParams(stateId: state.stateId, password: event.password, confirmPassword: event.confirmPassword));
      if (result.isRight) {
        emit(state.copyWith(submitPasswordStatus: FormzStatus.submissionSuccess, stateId: result.right));
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(submitPasswordStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
