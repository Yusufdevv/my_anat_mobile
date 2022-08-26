part of 'login_sign_up_bloc.dart';

@immutable
abstract class LoginSignUpEvent {}

class Login extends LoginSignUpEvent {
  final String username;
  final String password;
  final ValueChanged<String> onError;
  Login({required this.username, required this.password, required this.onError});
}

class CheckUsername extends LoginSignUpEvent {
  final String username;
  final String fullName;
  final ValueChanged<String> onError;
  final VoidCallback onSuccess;
  CheckUsername({
    required this.username,
    required this.fullName,
    required this.onError,
    required this.onSuccess,
  });
}

class CreateState extends LoginSignUpEvent {
  final String username;
  final String fullName;
  final ValueChanged<String> onError;

  final VoidCallback onSuccess;
  CreateState({
    required this.username,
    required this.fullName,
    required this.onError,
    required this.onSuccess,
  });
}

class SubmitNameUsername extends LoginSignUpEvent {
  final String username;
  final String fullName;
  final ValueChanged<String> onError;
  final VoidCallback onSuccess;
  SubmitNameUsername({
    required this.username,
    required this.fullName,
    required this.onError,
    required this.onSuccess,
  });
}

class SubmitPhone extends LoginSignUpEvent {
  final String phone;
  final ValueChanged<String> onError;
  final VoidCallback onSuccess;
  SubmitPhone({
    required this.phone,
    required this.onError,
    required this.onSuccess,
  });
}

class SubmitEmail extends LoginSignUpEvent {
  final String email;
  final ValueChanged<String> onError;
  final VoidCallback onSuccess;
  SubmitEmail({
    required this.email,
    required this.onError,
    required this.onSuccess,
  });
}

class SubmitChangedPhone extends LoginSignUpEvent {
  final String phone;
  final ValueChanged<String> onError;
  final VoidCallback onSuccess;
  SubmitChangedPhone({
    required this.phone,
    required this.onError,
    required this.onSuccess,
  });
}

class SubmitChangedEmail extends LoginSignUpEvent {
  final String email;
  final ValueChanged<String> onError;
  final VoidCallback onSuccess;
  SubmitChangedEmail({
    required this.email,
    required this.onError,
    required this.onSuccess,
  });
}

class ChangeConfirmationType extends LoginSignUpEvent {
  final String type;
  ChangeConfirmationType({required this.type});
}

class SubmitCode extends LoginSignUpEvent {
  final String code;
  final VoidCallback onSuccess;
  final ValueChanged<String> onError;
  SubmitCode({
    required this.code,
    required this.onSuccess,
    required this.onError,
  });
}

class SubmitPassword extends LoginSignUpEvent {
  final String password;
  final String confirmPassword;

  final ValueChanged<String> onError;
  SubmitPassword({
    required this.confirmPassword,
    required this.password,
    required this.onError,
  });
}

class ResendCode extends LoginSignUpEvent {}

class SetTimer extends LoginSignUpEvent {
  final int secondsLeft;
  SetTimer({required this.secondsLeft});
}
