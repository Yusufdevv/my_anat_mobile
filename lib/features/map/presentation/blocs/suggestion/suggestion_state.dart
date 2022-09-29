part of 'suggestion_bloc.dart';

@Freezed()
class SuggestionState with _$SuggestionState {
  factory SuggestionState({
    @Default([]) List<SuggestionModel> list,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(0) int currentPage,
    @Default('') String searchText,
  }) = _SuggestionState;
}
