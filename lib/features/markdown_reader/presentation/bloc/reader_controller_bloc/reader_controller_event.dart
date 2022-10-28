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

class SelectFontFamily extends ReaderControllerEvent {
  final String fontFamily;
  SelectFontFamily({required this.fontFamily});
}

class UpgradeFontSize extends ReaderControllerEvent {}

class DowngradeFontSize extends ReaderControllerEvent {}

class SetWebPageData extends ReaderControllerEvent {
  final String data;
  final String? colorName;
  final double? fontSizePercentage;
  SetWebPageData({required this.data, this.fontSizePercentage, this.colorName});
}
