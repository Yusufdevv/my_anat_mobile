import 'package:anatomica/assets/colors/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'reader_controller_event.dart';

part 'reader_controller_state.dart';

class ReaderControllerBloc
    extends Bloc<ReaderControllerEvent, ReaderControllerState> {
  ReaderControllerBloc() : super(const ReaderControllerState()) {
    String colorFunction = '';
    on<SetWebPage>((event, emit) {
      emit(state.copyWith(
          jsFunction: 'setSize(${state.fontSizePercentage})',
          journalIndex: event.index));
    });
    on<SelectColor>((event, emit) {
      colorFunction = event.colorName;
      emit(state.copyWith(
          selectedColor: event.color,
          selectedTextColor: event.textColor,
          jsFunction: event.colorName));
    });
    on<UpgradeFontSize>((event, emit) {
      final size = state.fontSizePercentage + 1;
      emit(state.copyWith(
          fontSizePercentage: size, jsFunction: 'setSize($size)'));
    });
    on<DowngradeFontSize>((event, emit) {
      final size = state.fontSizePercentage - 1;
      emit(state.copyWith(
          fontSizePercentage: size, jsFunction: 'setSize($size)'));
    });
    on<ChangeReaderLanguage>((event, emit) {
      emit(state.copyWith(isRussian: event.isRussian));
    });
  }
}
