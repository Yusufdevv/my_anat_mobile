part of 'header_manager_bloc.dart';

@immutable
abstract class HeaderManagerEvent {}

class ChangeHeaderScrollPosition extends HeaderManagerEvent {
  final double headerPosition;
  ChangeHeaderScrollPosition({required this.headerPosition});
}
