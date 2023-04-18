import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:anatomica/features/auth/domain/usecases/check_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/confirm_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/create_new_state_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/login_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/resend_code_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_name_username_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_password_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_phone_usecase.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';

part 'login_sign_up_event.dart';
part 'login_sign_up_state.dart';

class LoginSignUpBloc extends Bloc<LoginSignUpEvent, LoginSignUpState> {
  final LoginUseCase _loginUseCase = LoginUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final CheckUsernameUseCase _checkUsernameUseCase = CheckUsernameUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final CreateNewStateUseCase _createNewStateUseCase = CreateNewStateUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final SubmitNameUserNameUseCase _submitNameUsernameUseCase = SubmitNameUserNameUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final SubmitPhoneUseCase _submitPhoneUseCase = SubmitPhoneUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final SubmitEmailUseCase _submitEmailUseCase = SubmitEmailUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final ConfirmUseCase _confirmUseCase = ConfirmUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final SubmitPasswordUseCase _submitPasswordUseCase = SubmitPasswordUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final ResendCodeUseCase _resendCodeUseCase = ResendCodeUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final SubmitChangedEmailUseCase _submitChangedEmailUseCase = SubmitChangedEmailUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  final SubmitChangedPhoneUseCase _submitChangedPhoneUseCase = SubmitChangedPhoneUseCase(
    repository: serviceLocator<AuthenticationRepositoryImpl>(),
  );
  LoginSignUpBloc() : super(const LoginSignUpState.empty()) {
    on<Login>((event, emit) async {
      emit(state.copyWith(loginStatus: FormzStatus.submissionInProgress));
      final loginResult = await _loginUseCase.call(LoginParams(password: event.password, username: event.username));
      if (loginResult.isRight) {
        emit(state.copyWith(loginStatus: FormzStatus.submissionSuccess));
      } else {
        if (loginResult.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
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
          event.onError(LocaleKeys.network_error);
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        } else {
          event.onError(result.left.toString());
        }
        emit(state.copyWith(checkUsernameStatus: FormzStatus.submissionFailure));
      }
    });
    on<HideMainTabEvent>((event, emit) async {
      emit(state.copyWith(showMainTab: event.showMainTab));
    });
    on<CreateState>((event, emit) async {
      final result = await _createNewStateUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(stateId: result.right));
        add(SubmitNameUsername(
            username: event.username, fullName: event.fullName, onError: event.onError, onSuccess: event.onSuccess));
      } else {}
    });
    on<SubmitNameUsername>((event, emit) async {
      final result = await _submitNameUsernameUseCase
          .call(NameUsernameParams(stateId: state.stateId, username: event.username, name: event.fullName));
      if (result.isRight) {
        emit(state.copyWith(checkUsernameStatus: FormzStatus.submissionSuccess, stateId: result.right));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(checkUsernameStatus: FormzStatus.submissionFailure));
      }
    });
    on<ChangeConfirmationType>((event, emit) {
      emit(state.copyWith(confirmationType: event.type));
    });
    on<SubmitPhone>((event, emit) async {
      emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionInProgress));
      final result = await _submitPhoneUseCase.call(PhoneParams(stateId: state.stateId, phone: event.phone));
      if (result.isRight) {
        emit(state.copyWith(
            submitPhoneEmailStatus: FormzStatus.submissionSuccess,
            stateId: result.right,
            phoneEmail: MyFunctions.formatPhone(event.phone),
            secondsLeft: 0));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
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
        emit(state.copyWith(
            submitPhoneEmailStatus: FormzStatus.submissionSuccess,
            stateId: result.right,
            phoneEmail: event.email,
            secondsLeft: 0));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
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
          event.onError(LocaleKeys.network_error);
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
          event.onError(LocaleKeys.network_error);
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(submitPasswordStatus: FormzStatus.submissionFailure));
      }
    });
    on<ResendCode>((event, emit) async {
      await _resendCodeUseCase.call(state.stateId);
    });
    on<SetTimer>((event, emit) {
      emit(state.copyWith(secondsLeft: event.secondsLeft));
    });
    on<SubmitChangedEmail>((event, emit) async {
      emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionInProgress));
      final result = await _submitChangedEmailUseCase.call(EmailParams(stateId: state.stateId, email: event.email));
      if (result.isRight) {
        emit(state.copyWith(
          submitPhoneEmailStatus: FormzStatus.submissionSuccess,
          stateId: result.right,
          phoneEmail: event.email,
          secondsLeft: 0,
        ));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionFailure));
      }
    });
    on<SubmitChangedPhone>((event, emit) async {
      emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionInProgress));
      final result = await _submitChangedPhoneUseCase.call(PhoneParams(stateId: state.stateId, phone: event.phone));
      if (result.isRight) {
        emit(state.copyWith(
          submitPhoneEmailStatus: FormzStatus.submissionSuccess,
          stateId: result.right,
          phoneEmail: MyFunctions.formatPhone(event.phone),
          secondsLeft: 0,
        ));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError(LocaleKeys.network_error);
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(submitPhoneEmailStatus: FormzStatus.submissionFailure));
      }
    });
  }
}
