import 'package:anatomica/features/map/data/models/suggestion.dart';
import 'package:anatomica/features/map/domain/usecases/get_suggestions.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'suggestion_event.dart';

part 'suggestion_state.dart';

part 'suggestion_bloc.freezed.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final GetSuggestionsUseCase getSuggestions;
  final bool isDoctor;

  SuggestionBloc(this.getSuggestions, this.isDoctor)
      : super(SuggestionState()) {
    on<SuggestionEvent>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getSuggestions(
          SuggestionParam(isDoctor: isDoctor, search: event.text));
      if (result.isRight) {
        emit(state.copyWith(
            status: FormzStatus.submissionInProgress, list: result.right));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    }, transformer: debounce(const Duration(milliseconds: 200)));
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
