part of 'h_articles_bloc.dart';

@Freezed()
class HArticlesState with _$HArticlesState {
  factory HArticlesState({
    @Default([]) List<JournalArticleEntity> articles,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(false) bool fetchMore,
    String? next,
    @Default(0) int organizationId,
  }) = _HArticlesState;
}
