import 'package:anatomica/features/map/data/models/suggestion.dart';
import 'package:anatomica/features/map/domain/usecases/get_suggestions.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'suggestion_bloc.freezed.dart';
part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final GetSuggestionsUseCase getSuggestions;

  SuggestionBloc(this.getSuggestions) : super(SuggestionState()) {
    on<_GetSuggestions>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress, searchText: event.text));
      final result = await getSuggestions(SuggestionParam(
        where: 'Suggestion Bloc _GetSuggestions',
        isDoctor: state.currentPage == 1,
        search: event.text,
      ));
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress, list: result.right));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
    }, transformer: debounce(const Duration(milliseconds: 200)));
    on<_ChangePage>((event, emit) async {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await getSuggestions(
          SuggestionParam(where: 'Suggestion Bloc _ChangePage', isDoctor: event.page == 1, search: state.searchText));
      if (result.isRight) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress, list: result.right));
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
        ));
      }
      emit(state.copyWith(currentPage: event.page));
    });
  }

  EventTransformer<MyEvent> debounce<MyEvent>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
