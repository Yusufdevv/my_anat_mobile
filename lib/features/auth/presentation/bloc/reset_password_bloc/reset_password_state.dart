part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  final FormzStatus createNewStateStatus;
  final FormzStatus submitCodeStatus;
  final String emailPhoneNumber;
  final int secondsLeft;
  final String stateId;
  final String confirmationType;

  const ResetPasswordState({
    required this.secondsLeft,
    required this.stateId,
    required this.submitCodeStatus,
    required this.createNewStateStatus,
    required this.emailPhoneNumber,
    required this.confirmationType,
  });

  const ResetPasswordState.empty([
    this.secondsLeft = 0,
    this.stateId = '',
    this.submitCodeStatus = FormzStatus.pure,
    this.createNewStateStatus = FormzStatus.pure,
    this.emailPhoneNumber = '',
    this.confirmationType = 'phone',
  ]);

  ResetPasswordState copyWith({
    FormzStatus? createNewStateStatus,
    FormzStatus? submitCodeStatus,
    String? emailPhoneNumber,
    int? secondsLeft,
    String? stateId,
    String? confirmationType,
  }) =>
      ResetPasswordState(
          secondsLeft: secondsLeft ?? this.secondsLeft,
          stateId: stateId ?? this.stateId,
          submitCodeStatus: submitCodeStatus ?? this.submitCodeStatus,
          createNewStateStatus: createNewStateStatus ?? this.createNewStateStatus,
          emailPhoneNumber: emailPhoneNumber ?? this.emailPhoneNumber,
          confirmationType: confirmationType ?? this.confirmationType);
  @override
  List<Object?> get props => [
        secondsLeft,
        stateId,
        submitCodeStatus,
        createNewStateStatus,
        emailPhoneNumber,
        confirmationType,
      ];
}
