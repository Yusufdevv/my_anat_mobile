import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'hospital_list_event.dart';
part 'hospital_list_state.dart';

class HospitalListBloc extends Bloc<HospitalListEvent, HospitalListState> {
  HospitalListBloc() : super(const HospitalListState.empty()) {
    on<ChangeScreenState>((event, emit) {
      emit(state.copyWith(screenState: event.crossFadeState));
    });
  }
}
