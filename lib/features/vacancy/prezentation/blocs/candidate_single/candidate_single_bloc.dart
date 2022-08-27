import 'package:anatomica/features/vacancy/data/models/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:anatomica/features/vacancy/domain/usecases/candidate_single.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:formz/formz.dart';

part 'candidate_single_event.dart';

part 'candidate_single_state.dart';

class CandidateSingleBloc extends Bloc<CandidateSingleEvent, CandidateSingleState> {
  final CandidateSingleUseCase candidateSingleUseCase;

  CandidateSingleBloc({required this.candidateSingleUseCase})
      : super(
          CandidateSingleState(
            status: FormzStatus.pure,
            candidate: CandidateSingleModel.fromJson(const {}),
          ),
        ) {
    on<GetCandidateSingleEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await candidateSingleUseCase.call(CandidateSingleParams(id: event.id));
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess, candidate: result.right));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
