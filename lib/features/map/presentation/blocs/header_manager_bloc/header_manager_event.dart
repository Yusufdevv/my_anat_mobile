part of 'header_manager_bloc.dart';

@immutable
abstract class HeaderManagerEvent {}

class ChangeHeaderScrollPosition extends HeaderManagerEvent {
  final double headerPosition;

  ChangeHeaderScrollPosition({required this.headerPosition});
}

class ChangeVacancyScrollPosition extends HeaderManagerEvent {
  final double headerPosition;

  ChangeVacancyScrollPosition({required this.headerPosition});
}
