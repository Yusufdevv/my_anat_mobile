import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'reader_controller_event.dart';
part 'reader_controller_state.dart';

class ReaderControllerBloc extends Bloc<ReaderControllerEvent, ReaderControllerState> {
  ReaderControllerBloc() : super(const ReaderControllerState()) {
    // Uri.dataFromString(
    //     widget.data
    //         .replaceAll(
    // RegExp(r'''<body[^>]+class\s*=\s*['"]([^'"]+)['"][^>]*>''').firstMatch(widget.data)?.group(1) ??
    //     ''
    // ,
    //         'dsa')
    //         .replaceAll(RegExp(r'''\b(?:font-size\s*?:\s*([^;>]*?)(?=[;">}]))'''), ''),
    //     mimeType: 'text/html',
    //     encoding: Encoding.getByName('utf-8'))
    //     .toString();
    on<SetWebPageData>((event, emit) {
      final data = event.data.replaceAll(
        RegExp(r'''<body[^>]+class\s*=\s*['"]([^'"]+)['"][^>]*>''').firstMatch(event.data)?.group(1) ?? '',
        event.colorName ?? state.colorName,
      );
      log(data);
      String fontSizeFixedData = data;
      final fontSizeRegex = RegExp(r'''\b(?:font-size\s*?:\s*([^;>]*?)(?=[;">}]))''');
      final fontSizeRegexValues = fontSizeRegex.allMatches(fontSizeFixedData).toList();
      for (int i = 0; i < fontSizeRegexValues.length; i++) {
        fontSizeFixedData = fontSizeFixedData.replaceAll(fontSizeRegexValues[i].group(1) ?? '',
            '${(int.tryParse(fontSizeRegexValues[i].group(1) ?? '') ?? 0) * (event.fontSizePercentage ?? state.fontSizePercentage)}px');
      }
      emit(state.copyWith(changedWebPage: fontSizeFixedData));
    });
    on<SelectColor>((event, emit) {
      emit(state.copyWith(selectedColor: event.color, selectedTextColor: event.textColor));

      add(SetWebPageData(data: state.changedWebPage, colorName: event.colorName));
    });
    on<SelectFontFamily>((event, emit) {
      emit(state.copyWith(selectedFontFamily: event.fontFamily));
      add(SetWebPageData(data: state.changedWebPage));
    });
    on<UpgradeFontSize>((event, emit) {
      emit(state.copyWith(fontSizePercentage: state.fontSizePercentage + 0.2));
      add(SetWebPageData(data: state.changedWebPage, fontSizePercentage: state.fontSizePercentage + 0.2));
    });
    on<DowngradeFontSize>((event, emit) {
      emit(state.copyWith(fontSizePercentage: state.fontSizePercentage - 0.2));
      add(SetWebPageData(data: state.changedWebPage, fontSizePercentage: state.fontSizePercentage - 0.2));
    });
  }
}
