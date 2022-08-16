part of 'show_pop_up_bloc.dart';

class ShowPopUpState extends Equatable {
  final String message;
  final bool showPopUp;
  const ShowPopUpState({
    required this.message,
    required this.showPopUp,
  });

  ShowPopUpState copyWith({
    String? message,
    bool? showPopUp,
  }) =>
      ShowPopUpState(
        message: message ?? this.message,
        showPopUp: showPopUp ?? this.showPopUp,
      );
  @override
  List<Object?> get props => [
        showPopUp,
        message,
      ];
}
