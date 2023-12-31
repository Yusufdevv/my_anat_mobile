part of 'restore_bloc.dart';

@Freezed()
class RestoreState with _$RestoreState {
  factory RestoreState({
    @Default(FormzStatus.pure) FormzStatus sendCodeStatus,
    @Default(FormzStatus.pure) FormzStatus verifyStatus,
    @Default('') String signature,
    @Default('') String phone,
    @Default('') String verifyError,
    bool? showRestore,
    @Default(FormzStatus.pure) FormzStatus myPaymentsStatus,
    @Default([]) List<PaymentHistoryModel> myPayments,
    @Default(false) bool myPaymentsFetchMore,
    String? myPaymentsNext,
  }) = _RestoreState;
}
