part of 'reader_controller_bloc.dart';

@immutable
abstract class ReaderControllerEvent {}

class SelectColor extends ReaderControllerEvent {
  final Color color;
  final Color textColor;
  SelectColor({required this.textColor, required this.color});
}

class SelectFontFamily extends ReaderControllerEvent {
  final String fontFamily;
  SelectFontFamily({required this.fontFamily});
}

class UpgradeFontSize extends ReaderControllerEvent {}

class DowngradeFontSize extends ReaderControllerEvent {}
