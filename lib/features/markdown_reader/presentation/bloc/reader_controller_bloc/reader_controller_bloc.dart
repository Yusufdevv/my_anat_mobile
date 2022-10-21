import 'package:anatomica/assets/colors/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reader_controller_event.dart';
part 'reader_controller_state.dart';

class ReaderControllerBloc extends Bloc<ReaderControllerEvent, ReaderControllerState> {
  ReaderControllerBloc() : super(const ReaderControllerState()) {
    on<SelectColor>((event, emit) {
      emit(state.copyWith(selectedColor: event.color, selectedTextColor: event.textColor));
    });
    on<SelectFontFamily>((event, emit) {
      emit(state.copyWith(selectedFontFamily: event.fontFamily));
    });
    on<UpgradeFontSize>((event, emit) {
      emit(state.copyWith(fontSizePercentage: state.fontSizePercentage + 0.2));
    });
    on<DowngradeFontSize>((event, emit) {
      emit(state.copyWith(fontSizePercentage: state.fontSizePercentage - 0.2));
    });
  }
}
