part of 'reader_controller_bloc.dart';

class ReaderControllerState extends Equatable {
  final Color selectedColor;
  final Color selectedTextColor;
  final String colorName;
  final String selectedFontFamily;
  final int fontSizeIndex;
  final String changedWebPage;
  final String changedDataAsWebPage;
  final String jsFunction;
  final int journalIndex;
  final String journalLang;

  const ReaderControllerState({
    this.selectedColor = white,
    this.journalLang = 'ru',
    this.selectedTextColor = textColor,
    this.selectedFontFamily = 'Averta CY',
    this.fontSizeIndex = 3,
    this.changedWebPage = '',
    this.colorName = '',
    this.changedDataAsWebPage = '',
    this.jsFunction = '',
    this.journalIndex = 0,
  });

  ReaderControllerState copyWith({
    Color? selectedColor,
    String? journalLangg,
    Color? selectedTextColor,
    String? selectedFontFamily,
    String? changedWebPage,
    String? colorName,
    String? changedDataAsWebPage,
    String? jsFunction,
    int? fontSizeIndex,
    int? journalIndex,
  }) =>
      ReaderControllerState(
        journalLang: journalLangg ?? this.journalLang,
        selectedColor: selectedColor ?? this.selectedColor,
        changedDataAsWebPage: changedDataAsWebPage ?? this.changedDataAsWebPage,
        colorName: colorName ?? this.colorName,
        changedWebPage: changedWebPage ?? this.changedWebPage,
        selectedTextColor: selectedTextColor ?? this.selectedTextColor,
        selectedFontFamily: selectedFontFamily ?? this.selectedFontFamily,
        fontSizeIndex: fontSizeIndex ?? this.fontSizeIndex,
        jsFunction: jsFunction ?? this.jsFunction,
        journalIndex: journalIndex ?? this.journalIndex,
      );

  @override
  List<Object?> get props => [
        selectedColor,
        journalLang,
        selectedTextColor,
        selectedFontFamily,
        fontSizeIndex,
        changedWebPage,
        colorName,
        changedDataAsWebPage,
        jsFunction,
        journalIndex,
      ];
}
