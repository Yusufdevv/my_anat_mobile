import 'dart:async';

import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:anatomica/features/map/domain/usecases/get_specialization.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'specialization_event.dart';

part 'specialization_state.dart';

part 'specialization_bloc.freezed.dart';

class SpecializationBloc
    extends Bloc<SpecializationEvent, SpecializationState> {
  final GetSpecializationUseCase getSpecs;

  SpecializationBloc(this.getSpecs) : super(SpecializationState()) {
    on<_GetSpecs>((event, emit) async {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
      ));
      final result = await getSpecs('');
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess,
            specializations: result.right.results));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    });
    on<_GetMoreSpecs>((event, emit) async {
      final result = await getSpecs(state.next);
      if (result.isRight) {
        emit(state.copyWith(specializations: result.right.results));
      } else {}
    });
    on<_SelectSpec>((event, emit) {
      emit(state.copyWith(selectedId: event.id));
    });
  }
}
