part of 'login_sign_up_bloc.dart';

class LoginSignUpState extends Equatable {
  final FormzStatus loginStatus;
  const LoginSignUpState({required this.loginStatus});
  const LoginSignUpState.empty([this.loginStatus = FormzStatus.pure]);
  LoginSignUpState copyWith({FormzStatus? loginStatus}) =>
      LoginSignUpState(loginStatus: loginStatus ?? this.loginStatus);

  @override
  List<Object?> get props => [loginStatus];
}
