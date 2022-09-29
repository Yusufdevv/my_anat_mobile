part of 'suggestion_bloc.dart';

@Freezed()
class SuggestionEvent with _$SuggestionEvent {
  factory SuggestionEvent.getSuggestions(String text) = _GetSuggestions;
  factory SuggestionEvent.changePage(int page) = _ChangePage;
}
