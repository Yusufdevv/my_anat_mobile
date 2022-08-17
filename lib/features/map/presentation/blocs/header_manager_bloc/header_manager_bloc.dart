import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'header_manager_event.dart';

part 'header_manager_state.dart';

class HeaderManagerBloc extends Bloc<HeaderManagerEvent, HeaderManagerState> {
  HeaderManagerBloc()
      : super(const HeaderManagerState(isHeaderScrolled: false, isScrolled: false)) {
    on<ChangeHeaderScrollPosition>(
      (event, emit) {
        if (event.headerPosition > 496 - kToolbarHeight) {
          emit(state.copyWith(isHeaderScrolled: true));
        } else {
          emit(state.copyWith(isHeaderScrolled: false));
        }
      },
    );
    on<ChangeVacancyScrollPosition>((event, emit) {
      if (event.headerPosition > 450 - kToolbarHeight) {
        emit(state.copyWith(isScrolled: true));
      } else {
        emit(state.copyWith(isScrolled: false));
      }
    });
  }
}
