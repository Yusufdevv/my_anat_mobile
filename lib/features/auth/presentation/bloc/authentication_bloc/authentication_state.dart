part of 'authentication_bloc.dart';

class AuthenticationState {
  final AuthenticationStatus status;
  const AuthenticationState._({required this.status});
  const AuthenticationState.authenticated() : this._(status: AuthenticationStatus.authenticated);
  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);
}
