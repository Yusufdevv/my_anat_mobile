import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'header_manager_event.dart';
part 'header_manager_state.dart';

class HeaderManagerBloc extends Bloc<HeaderManagerEvent, HeaderManagerState> {
  HeaderManagerBloc() : super(const HeaderManagerState(isHeaderScrolled: false)) {
    on<ChangeHeaderScrollPosition>(
      (event, emit) {
        if (event.headerPosition > 496 - kToolbarHeight) {
          emit(const HeaderManagerState(isHeaderScrolled: true));
        } else {
          emit(const HeaderManagerState(isHeaderScrolled: false));
        }
      },
    );
  }
}
