import 'dart:ui';

import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/exceptions/failures.dart';
import 'package:anatomica/features/profile/data/models/payment_history_model.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/my_payments_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/restore.dart';
import 'package:anatomica/features/profile/domain/usecases/send_verify_code.dart';
import 'package:anatomica/features/profile/domain/usecases/verify_restore.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restore_bloc.freezed.dart';
part 'restore_event.dart';
part 'restore_state.dart';

class RestoreBloc extends Bloc<RestoreEvent, RestoreState> {
  final SendRestoreCode sendRestore;
  final VerifyRestoreCode verifyRestore;
  final RestoreUseCase restore;
  final MyPaymentsUsecase _myPaymentsUsecase =
      MyPaymentsUsecase(repository: serviceLocator<ProfileRepositoryImpl>());

  RestoreBloc(
      {required this.sendRestore,
      required this.verifyRestore,
      required this.restore})
      : super(RestoreState()) {
    on<_SendCode>((event, emit) async {
      emit(state.copyWith(sendCodeStatus: FormzStatus.submissionInProgress));
      final result = await sendRestore.call(event.phone);
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
            verifyStatus: FormzStatus.submissionSuccess,
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
        emit(state.copyWith(
            verifyStatus: FormzStatus.submissionSuccess, showRestore: false));
        event.onSuccess();
      } else {
        emit(state.copyWith(verifyStatus: FormzStatus.submissionFailure));
      }
    });

    on<_GetMyPayHistory>((event, emit) async {
      emit(state.copyWith(myPaymentsStatus: FormzStatus.submissionInProgress));
      final result = await _myPaymentsUsecase
          .call(event.params ?? const MyPaymentsParams());
      if (result.isRight) {
        emit(
          state.copyWith(
            myPaymentsStatus: FormzStatus.submissionSuccess,
            myPayments: result.right.results,
            myPaymentsFetchMore: result.right.next != null,
            myPaymentsNext: result.right.next,
          ),
        );
      } else {
        emit(state.copyWith(myPaymentsStatus: FormzStatus.submissionFailure));
      }
    });

    on<_GetMoreMyPayHistory>((event, emit) async {
      final result = await _myPaymentsUsecase
          .call(MyPaymentsParams(next: state.myPaymentsNext));
      if (result.isRight) {
        emit(
          state.copyWith(
            myPayments: [...state.myPayments, ...result.right.results],
            myPaymentsFetchMore: result.right.next != null,
            myPaymentsNext: result.right.next,
          ),
        );
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
