part of 'restore_bloc.dart';

@Freezed()
class RestoreEvent with _$RestoreEvent {
  factory RestoreEvent.sendCode(
      {required String phone,
      required VoidCallback onSuccess,
      required ValueChanged<String> onError}) = _SendCode;

  factory RestoreEvent.resendCode(
      {required VoidCallback onSuccess, String? phone}) = _ResendCode;

  factory RestoreEvent.verifyCode(
      {required String code,
      required Function(String) onSuccess,
      required Function(String) onError}) = _VerifyCode;

  factory RestoreEvent.sendRestore(
      {required bool isJournal,
      required VoidCallback onSuccess,
      required String signature}) = _SendRestore;

  factory RestoreEvent.getMyPayHistory({MyPaymentsParams? params}) =
      _GetMyPayHistory;
  factory RestoreEvent.getMoreMyPayHistory({MyPaymentsParams? params}) =
      _GetMoreMyPayHistory;

  factory RestoreEvent.clear() = _Clear;
}
