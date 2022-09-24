part of 'suggestion_bloc.dart';


@Freezed()
class SuggestionState with _$SuggestionState {
  factory SuggestionState({
    @Default([]) List<SuggestionModel> list,
    @Default(FormzStatus.pure) FormzStatus status,

  })=_SuggestionState;
}


