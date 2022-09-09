part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  final FormzStatus changePasswordStatus;
  const ChangePasswordState({required this.changePasswordStatus});
  ChangePasswordState copyWith({FormzStatus? changePasswordStatus}) =>
      ChangePasswordState(changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus);
  @override
  List<Object?> get props => [changePasswordStatus];
}
