part of 'restore_bloc.dart';
@Freezed()
 class RestoreEvent with _$RestoreEvent  {
  factory RestoreEvent.sendCode({required String phone,required VoidCallback onSuccess})=_SendCode;
  factory RestoreEvent.resendCode({required VoidCallback onSuccess})=_ResendCode;
  factory RestoreEvent.verifyCode({required String code,required Function(String) onSuccess,required Function(String) onError})=_VerifyCode;
  factory RestoreEvent.sendRestore({required bool isJournal,required VoidCallback onSuccess,required String signature})=_SendRestore;
  factory RestoreEvent.clear()=_Clear;
}
