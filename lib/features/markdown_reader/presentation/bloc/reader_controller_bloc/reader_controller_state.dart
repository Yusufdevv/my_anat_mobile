part of 'reader_controller_bloc.dart';

class ReaderControllerState extends Equatable {
  final Color selectedColor;
  final Color selectedTextColor;
  final String selectedFontFamily;
  final double fontSizePercentage;
  const ReaderControllerState({
    this.selectedColor = white,
    this.selectedTextColor = textColor,
    this.selectedFontFamily = 'Averta CY',
    this.fontSizePercentage = 1.0,
  });
  ReaderControllerState copyWith({
    Color? selectedColor,
    Color? selectedTextColor,
    String? selectedFontFamily,
    double? fontSizePercentage,
  }) =>
      ReaderControllerState(
        selectedColor: selectedColor ?? this.selectedColor,
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
      ];
}
