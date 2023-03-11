part of 'login_sign_up_bloc.dart';

class LoginSignUpState extends Equatable {
  final FormzStatus loginStatus;
  final FormzStatus checkUsernameStatus;
  final String stateId;
  final String confirmationType;
  final FormzStatus submitPhoneEmailStatus;
  final FormzStatus submitCodeStatus;
  final FormzStatus submitPasswordStatus;
  final String phoneEmail;
  final int secondsLeft;
  final bool showMainTab;

  const LoginSignUpState({
    required this.loginStatus,
    required this.checkUsernameStatus,
    required this.stateId,
    required this.confirmationType,
    required this.submitCodeStatus,
    required this.submitPhoneEmailStatus,
    required this.submitPasswordStatus,
    required this.phoneEmail,
    required this.secondsLeft,
    this.showMainTab = true,
  });

  const LoginSignUpState.empty([
    this.loginStatus = FormzStatus.pure,
    this.checkUsernameStatus = FormzStatus.pure,
    this.stateId = '',
    this.confirmationType = 'phone',
    this.submitCodeStatus = FormzStatus.pure,
    this.submitPhoneEmailStatus = FormzStatus.pure,
    this.submitPasswordStatus = FormzStatus.pure,
    this.phoneEmail = '',
    this.secondsLeft = 0,
    this.showMainTab = true,
  ]);

  LoginSignUpState copyWith({
    FormzStatus? loginStatus,
    FormzStatus? checkUsernameStatus,
    FormzStatus? submitCodeStatus,
    FormzStatus? submitPhoneEmailStatus,
    FormzStatus? submitPasswordStatus,
    String? stateId,
    String? confirmationType,
    String? phoneEmail,
    int? secondsLeft,
    bool? showMainTab,
  }) =>
      LoginSignUpState(
        loginStatus: loginStatus ?? this.loginStatus,
        checkUsernameStatus: checkUsernameStatus ?? this.checkUsernameStatus,
        stateId: stateId ?? this.stateId,
        confirmationType: confirmationType ?? this.confirmationType,
        submitCodeStatus: submitCodeStatus ?? this.submitCodeStatus,
        submitPhoneEmailStatus:
            submitPhoneEmailStatus ?? this.submitPhoneEmailStatus,
        submitPasswordStatus: submitPasswordStatus ?? this.submitPasswordStatus,
        phoneEmail: phoneEmail ?? this.phoneEmail,
        secondsLeft: secondsLeft ?? this.secondsLeft,
        showMainTab: showMainTab ?? this.showMainTab,
      );

  @override
  List<Object?> get props => [
        loginStatus,
        checkUsernameStatus,
        stateId,
        confirmationType,
        submitPhoneEmailStatus,
        submitCodeStatus,
        submitPasswordStatus,
        phoneEmail,
        secondsLeft,
        showMainTab,
      ];
}
