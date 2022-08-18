part of 'show_pop_up_bloc.dart';

@immutable
abstract class ShowPopUpEvent {}

class ShowPopUp extends ShowPopUpEvent {
  final String message;
  ShowPopUp({required this.message});
}

class HidePopUp extends ShowPopUpEvent {}
