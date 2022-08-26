import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/core/usecases/usecase.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/usecases/confirm_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/create_reset_password_new_state_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/resend_password_reset_code_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_reset_password_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_changed_reset_password_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_password_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_reset_password_email_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_reset_password_phone_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/submit_reset_password_usecase.dart';
import 'package:anatomica/features/auth/domain/usecases/verify_reset_password_code_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final CreateResetPasswordNewStateUseCase _createResetPasswordNewStateUseCase;
  final SubmitResetPasswordPhoneUseCase _submitResetPasswordPhoneUseCase;
  final SubmitResetPasswordEmailUseCase _submitResetPasswordEmailUseCase;
  final VerifyResetPasswordCodeUseCase _verifyResetPasswordCodeUseCase;
  final SubmitResetPasswordUseCase _submitResetPasswordUseCase;
  final SubmitChangedResetPasswordPhoneUseCase _submitChangedResetPasswordPhoneUseCase;
  final SubmitChangedResetPasswordEmailUseCase _submitChangedResetPasswordEmailUseCase;
  final ResendPasswordResetCodeUseCase _resendPasswordResetCodeUseCase;

  ResetPasswordBloc({
    required CreateResetPasswordNewStateUseCase createResetPasswordNewStateUseCase,
    required SubmitResetPasswordPhoneUseCase submitResetPasswordPhoneUseCase,
    required SubmitResetPasswordEmailUseCase submitResetPasswordEmailUseCase,
    required VerifyResetPasswordCodeUseCase verifyResetPasswordCodeUseCase,
    required SubmitResetPasswordUseCase submitResetPasswordUseCase,
    required SubmitChangedResetPasswordPhoneUseCase submitChangedResetPasswordPhoneUseCase,
    required SubmitChangedResetPasswordEmailUseCase submitChangedResetPasswordEmailUseCase,
    required ResendPasswordResetCodeUseCase resendPasswordResetCodeUseCase,
  })  : _createResetPasswordNewStateUseCase = createResetPasswordNewStateUseCase,
        _submitResetPasswordPhoneUseCase = submitResetPasswordPhoneUseCase,
        _submitResetPasswordEmailUseCase = submitResetPasswordEmailUseCase,
        _verifyResetPasswordCodeUseCase = verifyResetPasswordCodeUseCase,
        _submitResetPasswordUseCase = submitResetPasswordUseCase,
        _submitChangedResetPasswordPhoneUseCase = submitChangedResetPasswordPhoneUseCase,
        _submitChangedResetPasswordEmailUseCase = submitChangedResetPasswordEmailUseCase,
        _resendPasswordResetCodeUseCase = resendPasswordResetCodeUseCase,
        super(const ResetPasswordState.empty()) {
    on<CreateNewState>((event, emit) async {
      emit(state.copyWith(createNewStateStatus: FormzStatus.submissionInProgress));
      final result = await _createResetPasswordNewStateUseCase.call(NoParams());
      if (result.isRight) {
        emit(state.copyWith(stateId: result.right));
        event.onSuccess();
      } else {
        print('create state error: ${result.left}');
      }
    });
    on<SubmitPhone>((event, emit) async {
      final result =
          await _submitResetPasswordPhoneUseCase.call(PhoneParams(stateId: state.stateId, phone: event.phone));
      if (result.isRight) {
        emit(
          state.copyWith(
            createNewStateStatus: FormzStatus.submissionSuccess,
            stateId: result.right,
            emailPhoneNumber: MyFunctions.formatPhone(event.phone),
            secondsLeft: 0,
          ),
        );
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(createNewStateStatus: FormzStatus.submissionFailure));
      }
    });
    on<SubmitEmail>((event, emit) async {
      final result =
          await _submitResetPasswordEmailUseCase.call(EmailParams(stateId: state.stateId, email: event.email));
      if (result.isRight) {
        emit(state.copyWith(
            createNewStateStatus: FormzStatus.submissionSuccess,
            stateId: result.right,
            emailPhoneNumber: event.email,
            secondsLeft: 0));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(createNewStateStatus: FormzStatus.submissionFailure));
      }
    });
    on<ChangeConfirmationType>((event, emit) {
      emit(state.copyWith(confirmationType: event.confirmationType));
    });
    on<VerifyCode>((event, emit) async {
      emit(state.copyWith(submitCodeStatus: FormzStatus.submissionInProgress));
      final result =
          await _verifyResetPasswordCodeUseCase.call(ConfirmationParams(stateId: state.stateId, code: event.code));
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
      final result = await _submitResetPasswordUseCase.call(
          PasswordParams(stateId: state.stateId, password: event.password, confirmPassword: event.confirmPassword));
      if (result.isRight) {
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
      }
    });
    on<SubmitChangedPhone>((event, emit) async {
      emit(state.copyWith(createNewStateStatus: FormzStatus.submissionInProgress));
      final result =
          await _submitChangedResetPasswordPhoneUseCase.call(PhoneParams(stateId: state.stateId, phone: event.phone));
      if (result.isRight) {
        emit(state.copyWith(
          createNewStateStatus: FormzStatus.submissionSuccess,
          stateId: result.right,
          emailPhoneNumber: MyFunctions.formatPhone(event.phone),
          secondsLeft: 0,
        ));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(createNewStateStatus: FormzStatus.submissionFailure));
      }
    });
    on<SubmitChangedEmail>((event, emit) async {
      emit(state.copyWith(createNewStateStatus: FormzStatus.submissionInProgress));
      final result =
          await _submitChangedResetPasswordEmailUseCase.call(EmailParams(stateId: state.stateId, email: event.email));
      if (result.isRight) {
        emit(state.copyWith(
          createNewStateStatus: FormzStatus.submissionSuccess,
          stateId: result.right,
          emailPhoneNumber: event.email,
          secondsLeft: 0,
        ));
        event.onSuccess();
      } else {
        if (result.left is DioFailure) {
          event.onError('Tarmoqqa ulanishda muammo');
        } else if (result.left is ParsingFailure) {
          event.onError((result.left as ParsingFailure).errorMessage);
        } else if (result.left is ServerFailure) {
          event.onError((result.left as ServerFailure).errorMessage);
        }
        emit(state.copyWith(createNewStateStatus: FormzStatus.submissionFailure));
      }
    });
    on<SetTime>((event, emit) {
      emit(state.copyWith(secondsLeft: event.secondsLeft));
    });
    on<ResendCode>((event, emit) async {
      await _resendPasswordResetCodeUseCase.call(state.stateId);
    });
  }
}
