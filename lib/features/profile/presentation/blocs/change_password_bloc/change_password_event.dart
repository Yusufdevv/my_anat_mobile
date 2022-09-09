part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {}

class ChangePassword extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;
  final String newPasswordConfirmed;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;
  ChangePassword({
    required this.newPassword,
    required this.currentPassword,
    required this.onSuccess,
    required this.onFailure,
    required this.newPasswordConfirmed,
  });
}
