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
  CheckUsername({required this.username});
}
