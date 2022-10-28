part of 'reader_controller_bloc.dart';

class ReaderControllerState extends Equatable {
  final Color selectedColor;
  final Color selectedTextColor;
  final String colorName;
  final String selectedFontFamily;
  final double fontSizePercentage;
  final String changedWebPage;
  final String changedDataAsWebPage;
  const ReaderControllerState({
    this.selectedColor = white,
    this.selectedTextColor = textColor,
    this.selectedFontFamily = 'Averta CY',
    this.fontSizePercentage = 1.0,
    this.changedWebPage = '',
    this.colorName = '',
    this.changedDataAsWebPage = '',
  });
  ReaderControllerState copyWith({
    Color? selectedColor,
    Color? selectedTextColor,
    String? selectedFontFamily,
    String? changedWebPage,
    String? colorName,
    String? changedDataAsWebPage,
    double? fontSizePercentage,
  }) =>
      ReaderControllerState(
        selectedColor: selectedColor ?? this.selectedColor,
        changedDataAsWebPage: changedDataAsWebPage ?? this.changedDataAsWebPage,
        colorName: colorName ?? this.colorName,
        changedWebPage: changedWebPage ?? this.changedWebPage,
        selectedTextColor: selectedTextColor ?? this.selectedTextColor,
        selectedFontFamily: selectedFontFamily ?? this.selectedFontFamily,
        fontSizePercentage: fontSizePercentage ?? this.fontSizePercentage,
      );

  @override
  List<Object?> get props => [
        selectedColor,
        selectedTextColor,
        selectedFontFamily,
        fontSizePercentage,
        changedWebPage,
        colorName,
        changedDataAsWebPage,
      ];
}
