part of 'reader_controller_bloc.dart';

class ReaderControllerState extends Equatable {
  final Color selectedColor;
  final Color selectedTextColor;
  final String colorName;
  final String selectedFontFamily;
  final int fontSizePercentage;
  final String changedWebPage;
  final String changedDataAsWebPage;
  final String jsFunction;
  final int journalIndex;
  final bool isRussian;

  const ReaderControllerState({
    this.selectedColor = white,
    this.isRussian = true,
    this.selectedTextColor = textColor,
    this.selectedFontFamily = 'Averta CY',
    this.fontSizePercentage = 20,
    this.changedWebPage = '',
    this.colorName = '',
    this.changedDataAsWebPage = '',
    this.jsFunction = '',
    this.journalIndex = 0,
  });

  ReaderControllerState copyWith({
    Color? selectedColor,
    bool? isRussian,
    Color? selectedTextColor,
    String? selectedFontFamily,
    String? changedWebPage,
    String? colorName,
    String? changedDataAsWebPage,
    String? jsFunction,
    int? fontSizePercentage,
    int? journalIndex,
  }) =>
      ReaderControllerState(
        isRussian: isRussian ?? this.isRussian,
        selectedColor: selectedColor ?? this.selectedColor,
        changedDataAsWebPage: changedDataAsWebPage ?? this.changedDataAsWebPage,
        colorName: colorName ?? this.colorName,
        changedWebPage: changedWebPage ?? this.changedWebPage,
        selectedTextColor: selectedTextColor ?? this.selectedTextColor,
        selectedFontFamily: selectedFontFamily ?? this.selectedFontFamily,
        fontSizePercentage: fontSizePercentage ?? this.fontSizePercentage,
        jsFunction: jsFunction ?? this.jsFunction,
        journalIndex: journalIndex ?? this.journalIndex,
      );

  @override
  List<Object?> get props => [
        selectedColor,
        isRussian,
        selectedTextColor,
        selectedFontFamily,
        fontSizePercentage,
        changedWebPage,
        colorName,
        changedDataAsWebPage,
        jsFunction,
        journalIndex,
      ];
}
