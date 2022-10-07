import 'dart:async';
import 'dart:ui';

import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/features/profile/domain/usecases/restore.dart';
import 'package:anatomica/features/profile/domain/usecases/send_verify_code.dart';
import 'package:anatomica/features/profile/domain/usecases/verify_restore.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'restore_event.dart';

part 'restore_state.dart';

part 'restore_bloc.freezed.dart';

class RestoreBloc extends Bloc<RestoreEvent, RestoreState> {
  final SendRestoreCode sendRestore;
  final VerifyRestoreCode verifyRestore;
  final RestoreUseCase restore;

  RestoreBloc(
      {required this.sendRestore,
      required this.verifyRestore,
      required this.restore})
      : super(RestoreState()) {
    on<_SendCode>((event, emit) async {
      emit(state.copyWith(sendCodeStatus: FormzStatus.submissionInProgress));
      final result = await sendRestore(event.phone);
      if (result.isRight) {
        emit(state.copyWith(
            signature: result.right,
            phone: event.phone,
            sendCodeStatus: FormzStatus.submissionSuccess));
        event.onSuccess();
      } else {
        emit(state.copyWith(sendCodeStatus: FormzStatus.submissionFailure));
      }
    });
    on<_VerifyCode>((event, emit) async {
      emit(state.copyWith(verifyStatus: FormzStatus.submissionInProgress));
      final result = await verifyRestore(VerifyParam(
          code: event.code, signature: state.signature, phone: state.phone));
      if (result.isRight) {
        emit(state.copyWith(
            verifyStatus: FormzStatus.submissionFailure,
            signature: result.right));
        event.onSuccess(result.right);
      } else {
        emit(state.copyWith(
            verifyStatus: FormzStatus.submissionFailure,
            verifyError: (result.left as ServerFailure).errorMessage));
        event.onSuccess('');
      }
    });
    on<_SendRestore>((event, emit) async {
      emit(state.copyWith(verifyStatus: FormzStatus.submissionInProgress));
      final result = await restore(RestoreParam(
          phone: state.phone,
          signature: state.signature,
          isArticle: event.isJournal == false));
      if (result.isRight) {
        emit(state.copyWith(verifyStatus: FormzStatus.submissionSuccess));
        event.onSuccess();
      } else {
        emit(state.copyWith(verifyStatus: FormzStatus.submissionFailure));
      }
    });
    on<_ResendCode>((event, emit) async {
      final result = await sendRestore(state.phone);
      if (result.isRight) {
        emit(state.copyWith(
            signature: result.right,
            sendCodeStatus: FormzStatus.submissionSuccess));
        event.onSuccess();
      } else {
        emit(state.copyWith(sendCodeStatus: FormzStatus.submissionFailure));
      }
    });
    on<_Clear>((event, emit) {
      emit(RestoreState());
    });
  }
}
