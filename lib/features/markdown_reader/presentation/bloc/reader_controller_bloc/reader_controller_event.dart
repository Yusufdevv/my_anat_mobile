part of 'reader_controller_bloc.dart';

@immutable
abstract class ReaderControllerEvent {}

class SelectColor extends ReaderControllerEvent {
  final Color color;
  final Color textColor;
  final String colorName;

  SelectColor({
    required this.textColor,
    required this.color,
    required this.colorName,
  });
}

class SetWebPage extends ReaderControllerEvent {
  final int index;
  SetWebPage({required this.index});
}

class ChangeReaderLanguage extends ReaderControllerEvent {
  final String journalLang;
  ChangeReaderLanguage({required this.journalLang});
}

class UpgradeFontSize extends ReaderControllerEvent {}

class DowngradeFontSize extends ReaderControllerEvent {}
