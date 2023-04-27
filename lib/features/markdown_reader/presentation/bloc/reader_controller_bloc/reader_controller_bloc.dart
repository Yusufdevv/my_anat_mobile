import 'package:anatomica/assets/colors/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'reader_controller_event.dart';

part 'reader_controller_state.dart';

class ReaderControllerBloc extends Bloc<ReaderControllerEvent, ReaderControllerState> {
  ReaderControllerBloc() : super(const ReaderControllerState()) {
    on<SetWebPage>((event, emit) {
      emit(state.copyWith(jsFunction: 'setSize(${state.fontSizeIndex})', journalIndex: event.index));
    });
    on<SelectColor>((event, emit) {
      emit(state.copyWith(selectedColor: event.color, selectedTextColor: event.textColor, jsFunction: event.colorName));
    });
    on<UpgradeFontSize>((event, emit) {
      if (state.fontSizeIndex > 5) return;
      final size = state.fontSizeIndex + 1;
      emit(state.copyWith(fontSizeIndex: size, jsFunction: 'setSize($size)'));
    });
    on<DowngradeFontSize>((event, emit) {
      if (state.fontSizeIndex < 1) return;
      final size = state.fontSizeIndex - 1;
      emit(state.copyWith(fontSizeIndex: size, jsFunction: 'setSize($size)'));
    });
    on<ChangeReaderLanguage>((event, emit) {
      print('isRussian => ${event.journalLang}');
      emit(state.copyWith(journalLang: event.journalLang));
      print('after isRussian => ${state.journalLang}');
    });
  }
}
