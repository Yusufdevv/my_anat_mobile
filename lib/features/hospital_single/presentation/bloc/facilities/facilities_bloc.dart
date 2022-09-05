import 'dart:async';

import 'package:anatomica/features/hospital_single/domain/entities/comfort_entity.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_articles.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comforts.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'facilities_event.dart';

part 'facilities_state.dart';

part 'facilities_bloc.freezed.dart';

class FacilitiesBloc extends Bloc<FacilitiesEvent, FacilitiesState> {
  final GetComfortsUseCase getComforts;

  FacilitiesBloc(this.getComforts) : super(FacilitiesState()) {
    on<FacilitiesEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getComforts(TypeParameter(id: event.organizationId??-1, next: ''));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            comforts: result.right.results));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
