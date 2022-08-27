part of 'reset_password_bloc.dart';

@immutable
abstract class ResetPasswordEvent {}

class CreateNewState extends ResetPasswordEvent {
  final VoidCallback onSuccess;
  CreateNewState({
    required this.onSuccess,
  });
}

class SubmitPhone extends ResetPasswordEvent {
  final String phone;
  final VoidCallback onSuccess;
  final ValueChanged<String> onError;
  SubmitPhone({
    required this.phone,
    required this.onSuccess,
    required this.onError,
  });
}

class SubmitEmail extends ResetPasswordEvent {
  final String email;
  final VoidCallback onSuccess;
  final ValueChanged<String> onError;
  SubmitEmail({
    required this.email,
    required this.onError,
    required this.onSuccess,
  });
}

class ChangeConfirmationType extends ResetPasswordEvent {
  final String confirmationType;
  ChangeConfirmationType({required this.confirmationType});
}

class VerifyCode extends ResetPasswordEvent {
  final String code;
  final VoidCallback onSuccess;
  final ValueChanged<String> onError;
  VerifyCode({
    required this.code,
    required this.onSuccess,
    required this.onError,
  });
}

class SubmitChangedPhone extends ResetPasswordEvent {
  final String phone;
  final VoidCallback onSuccess;
  final ValueChanged<String> onError;
  SubmitChangedPhone({
    required this.phone,
    required this.onError,
    required this.onSuccess,
  });
}

class SubmitChangedEmail extends ResetPasswordEvent {
  final String email;
  final VoidCallback onSuccess;
  final ValueChanged<String> onError;
  SubmitChangedEmail({
    required this.email,
    required this.onSuccess,
    required this.onError,
  });
}

class SubmitPassword extends ResetPasswordEvent {
  final String password;
  final String confirmPassword;
  final ValueChanged<String> onError;
  SubmitPassword({
    required this.confirmPassword,
    required this.password,
    required this.onError,
  });
}

class SetTime extends ResetPasswordEvent {
  final int secondsLeft;
  SetTime({required this.secondsLeft});
}

class ResendCode extends ResetPasswordEvent {}
